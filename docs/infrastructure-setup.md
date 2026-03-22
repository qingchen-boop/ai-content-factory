# 基础设施设置 / Infrastructure Setup

> AI Content Factory — 服务器与基础设施配置指南

---

## 架构总览

```
┌──────────────────────────────────────────────────┐
│                   用户访问                        │
│                      ↓                           │
│         Vercel CDN (全球边缘节点)                │
│                      ↓                           │
│         Next.js App (Frontend + API)            │
│                      ↓                           │
│    Railway Workers (AI 任务队列 / 后台处理)      │
│                      ↓                           │
│    Supabase (PostgreSQL + Auth + Storage)        │
│                      ↓                           │
│    OpenAI / MiniMax API (AI 推理)                │
└──────────────────────────────────────────────────┘
```

---

## 第一步：GitHub 仓库初始化

```bash
# 1. 在 GitHub 创建空仓库
# 访问: https://github.com/new
# Repository name: ai-content-factory
# Private / Public: Private (开发阶段)

# 2. 本地初始化（如果本地没有代码）
git init
git add .
git commit -m "Initial commit: project structure"
git branch -M main
git remote add origin https://github.com/qingchen-boop/ai-content-factory.git
git push -u origin main
```

---

## 第二步：Vercel 部署配置

### 2.1 导入项目到 Vercel

```bash
# 安装 Vercel CLI
npm install -g vercel

# 登录
vercel login

# 在项目目录初始化
cd ai-content-factory
vercel
```

**或者通过网页操作：**
1. 访问 [vercel.com](https://vercel.com)
2. 点击 "New Project" → Import GitHub repository
3. 选择 `qingchen-boop/ai-content-factory`
4. Framework Preset: `Next.js`（自动检测）
5. 点击 "Deploy"

### 2.2 配置环境变量

在 Vercel Dashboard → Project → Settings → Environment Variables：

| 变量名 | 值 | 说明 |
|--------|-----|------|
| `NEXT_PUBLIC_SUPABASE_URL` | `https://xxx.supabase.co` | Supabase 项目 URL |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | `eyJ...` | Supabase 匿名 key（公开安全） |
| `SUPABASE_SERVICE_ROLE_KEY` | `eyJ...` | Supabase 服务端 key（保密） |
| `OPENAI_API_KEY` | `sk-...` | OpenAI API Key |
| `MINIMAX_API_KEY` | `sk-cp-...` | MiniMax API Key |
| `STRIPE_SECRET_KEY` | `sk_test_...` | Stripe Secret Key |
| `STRIPE_WEBHOOK_SECRET` | `whsec_...` | Stripe Webhook 密钥 |
| `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY` | `pk_test_...` | Stripe 公开 key |
| `NEXT_PUBLIC_APP_URL` | `https://aicontentfactory.com` | 正式环境 URL |

### 2.3 自定义域名（可选）

1. Vercel Dashboard → Project → Settings → Domains
2. 添加域名：`aicontentfactory.com`
3. 在域名注册商配置 DNS（参考 domain-strategy.md）
4. 等待 SSL 证书自动签发（约 5 分钟）

---

## 第三步：Supabase 项目创建

### 3.1 创建 Supabase 项目

```bash
# 访问 https://supabase.com/dashboard
# 点击 "New Project"
# 填写：
#   - Organization: 选择或创建组织
#   - Name: ai-content-factory
#   - Database Password: <生成强密码，妥善保存>
#   - Region: 选择靠近用户的区域（如 Singapore）
```

### 3.2 获取 API 凭证

项目创建后，在 **Settings → API** 中获取：

```
Project URL: https://xxxxx.supabase.co
anon/public key: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
service_role key: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### 3.3 数据库初始化

在 Supabase Dashboard → SQL Editor 中执行：

```sql
-- 用户表
CREATE TABLE public.users (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  email TEXT NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  stripe_customer_id TEXT,
  subscription_status TEXT DEFAULT 'free',
  subscription_tier TEXT DEFAULT 'free',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 启用 RLS
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- 用户只能读写自己的数据
CREATE POLICY "Users can manage own data" ON public.users
  FOR ALL USING (auth.uid() = id);

-- 内容生成记录表
CREATE TABLE public.generations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) NOT NULL,
  prompt TEXT NOT NULL,
  result JSONB,
  model TEXT NOT NULL,
  tokens_used INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 订阅表
CREATE TABLE public.subscriptions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) NOT NULL,
  stripe_subscription_id TEXT UNIQUE,
  stripe_price_id TEXT,
  status TEXT NOT NULL,
  current_period_start TIMESTAMPTZ,
  current_period_end TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

## 第四步：Stripe 配置

### 4.1 创建 Stripe 账号

访问 [stripe.com](https://stripe.com) → 注册账号（企业账号需验证资质）

### 4.2 获取 API Keys

Dashboard → Developers → API keys：

```
Publishable key:     pk_test_51...
Secret key:          sk_test_51...
```

### 4.3 创建产品与定价

1. Dashboard → Products → Add Product
2. 填写产品信息：
   - Name: AI Content Factory Pro
   - Description: 专业版订阅
3. 添加定价（按月/年）：
   - Price: $19/month 或 $190/year
   - 开启 "Metadata" 添加 `tier: pro`

### 4.4 配置 Webhook

1. Dashboard → Developers → Webhooks → Add endpoint
2. Endpoint URL: `https://your-domain.com/api/webhooks/stripe`
3. 监听事件：
   - `checkout.session.completed`
   - `customer.subscription.updated`
   - `customer.subscription.deleted`
   - `invoice.payment_failed`
4. 获取 Webhook Secret：`whsec_...`

### 4.5 开启 Stripe 客户门户

允许用户自助管理订阅（取消、升级、降级）：

```bash
# 在 Stripe Dashboard → Settings → Customer Portal → Customize
# 开启 "Customer management" 功能
```

---

## 第五步：Railway 配置（后台任务）

### 5.1 创建 Railway 项目

```bash
# 安装 Railway CLI
npm install -g @railway/cli

# 登录
railway login

# 初始化项目
cd ai-content-factory
railway init
```

### 5.2 部署 Worker

Railway 支持直接部署 Docker 容器或 Node.js 项目：

```bash
# 部署 worker 服务
railway up --service ai-worker
```

### 5.3 配置环境变量

在 Railway Dashboard → Project → Variables 设置：

```
NODE_ENV=production
REDIS_URL=redis://default:xxx@redis-cloud.redns.redis-cloud.com:18799
OPENAI_API_KEY=sk-...
MINIMAX_API_KEY=sk-cp-...
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJ...
```

---

## 第六步：域名购买与 DNS 配置

### 6.1 购买域名（Namecheap）

1. 访问 [namecheap.com](https://namecheap.com)
2. 搜索 `aicontentfactory.com`
3. 加入购物车 → 结算
4. WHOIS 隐私：选择 "WhoisGuard Free"
5. 支付（支持信用卡、PayPal）

### 6.2 DNS 配置

在 Namecheap → Dashboard → Domain List → Advanced DNS：

```
Type       Host      Value                    TTL
A Record   @         76.76.21.21             Automatic
CNAME      www       cname.vercel-dns.com    Automatic
TXT        @         vercel-domain-verification=xxxxxx  Automatic
```

等待 5–30 分钟 DNS 生效。

---

## 第七步：CI/CD 自动化

### GitHub Actions 自动部署到 Vercel

创建 `.github/workflows/deploy.yml`：

```yaml
name: Deploy to Vercel

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Install Vercel CLI
        run: npm install -g vercel
      
      - name: Pull Vercel Environment
        run: vercel pull --yes --environment=production --token=${{ secrets.VERCEL_TOKEN }}
      
      - name: Build Project
        run: vercel build --prod --token=${{ secrets.VERCEL_TOKEN }}
      
      - name: Deploy to Vercel
        run: vercel deploy --prebuilt --prod --token=${{ secrets.VERCEL_TOKEN }}
```

在 GitHub → Settings → Secrets 添加：

| Secret 名 | 值 |
|-----------|-----|
| `VERCEL_TOKEN` | Vercel Personal Access Token |

获取 Vercel Token：[vercel.com/account/tokens](https://vercel.com/account/tokens)

---

## 环境变量汇总表

### 开发环境 (.env.local)

```bash
# Supabase
NEXT_PUBLIC_SUPABASE_URL=https://xxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# AI
OPENAI_API_KEY=sk-proj-...
MINIMAX_API_KEY=sk-cp-...

# Stripe
STRIPE_SECRET_KEY=sk_test_...
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...

# App
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

---

## 快速检查清单

- [ ] GitHub 仓库创建并推送代码
- [ ] Vercel 项目创建并连接 GitHub
- [ ] Vercel 环境变量配置完成
- [ ] Supabase 项目创建，数据库表创建
- [ ] Stripe 账号注册，产品和定价创建
- [ ] Stripe Webhook 配置
- [ ] Railway 项目创建（后台任务）
- [ ] 域名购买
- [ ] DNS 配置完成
- [ ] HTTPS 证书生效
- [ ] GitHub Actions CI/CD 配置
- [ ] 本地开发环境 `.env.local` 配置

---

*最后更新：2026-03-22*
