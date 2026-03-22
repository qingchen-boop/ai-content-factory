# 技术栈选型 / Tech Stack

> AI Content Factory — 技术架构文档

---

## 1. 前端：Next.js + Vercel

### 为什么选择 Next.js？

- **React 生态最成熟的全栈框架**，社区活跃、文档完善、组件库丰富
- **App Router** 支持服务端渲染（SSR）和静态生成（SSG），SEO 友好
- **API Routes** 可快速编写 BFF 层，无需独立后端服务
- **Vercel 原生集成**，一键部署、自动预览分支、自动 HTTPS
- **TypeScript 支持**，类型安全，开发体验好

### 优缺点

| 优点 | 缺点 |
|------|------|
| 开发和部署体验极佳，Vercel 一键上线 | Vercel 美国节点对中国访问速度一般，需配合 CDN |
| SSR/SSG/ISR 灵活选择，性能优秀 | 冷启动在 serverless 环境可能稍慢 |
| 生态极其成熟，第三方库兼容性好 | Serverless 模式下的调试成本比传统 Node 稍高 |

---

## 2. 后端：Node.js + Supabase

### 为什么选择 Supabase？

- **Supabase = PostgreSQL + 实时 API + Auth + Storage + Edge Functions**
  一站式后端即服务，大幅降低运维成本
- **PostgreSQL 本身强大**：支持复杂查询、事务、全文搜索、GIS
- **实时订阅**：数据库变更实时推送到前端，聊天/协作场景天然支持
- **Auth 内置**：支持邮箱、手机、OAuth（Google/GitHub/微信等）
- **Edge Functions**：部署在边缘节点的 Deno/TypeScript 函数，低延迟
- **开源可自托管**：也可以自己部署，不被 vendor lock-in

### 优缺点

| 优点 | 缺点 |
|------|------|
| 大幅减少自建后端工作量，专注业务逻辑 | 大量数据量时（如数亿行）可能需迁移到专用数据库 |
| 实时功能开箱即用，无需自己搭 WebSocket | 需要适应其 row-level security (RLS) 权限模型 |
| 开源可自托管，灵活度高 | 文档和高级特性仍在快速迭代，部分功能不如 Firebase 成熟 |

---

## 3. AI：OpenAI API + MiniMax（备份）

### OpenAI API

- **GPT-4 / GPT-4o** 是目前最强大的通用语言模型
- 生态成熟，API 文档完善，SDK 支持所有主流语言
- 支持 Function Calling / Tool Use，便于构建 Agent 系统
- 适合：内容生成、摘要、翻译、对话等核心 AI 功能

**优点：**
- 模型能力强，效果稳定
- 生态完善，工具链成熟

**缺点：**
- 成本较高（GPT-4o $5/1M input tokens）
- 在部分地区访问不稳定

---

### MiniMax（备份方案）

- **国内可访问**，API 稳定，不受跨境网络影响
- **价格更低**，性价比优于 OpenAI
- **上下文长达 100 万 tokens**，适合长文本处理
- 适合：国内用户的内容生成、备份降本

**优点：**
- 国内访问稳定，延迟低
- 成本低，性价比高
- 支持长上下文

**缺点：**
- 模型能力相比 GPT-4 仍有差距
- 生态和工具链不如 OpenAI 丰富

**灾备策略：**
```
Primary: OpenAI → Fallback: MiniMax
通过统一 AI Gateway 封装，自动降级
```

---

## 4. 支付：Stripe

### 为什么选择 Stripe？

- **全球最成熟的在线支付平台**，支持 135+ 种货币
- **API 设计优雅**，文档详尽，集成体验极佳
- **订阅管理内置**：SaaS 必需的订阅计费、免费试用、升级/降级、取消管理
- **Stripe Atlas / Radar**：防欺诈、开票、退款处理完善
- **合规性**：PCI DSS Level 1，放心处理支付数据
- 支持支付宝 / WeChat Pay（通过 Alipay / WeChat Pay 插件）

### 优缺点

| 优点 | 缺点 |
|------|------|
| 开发者体验极佳，API 清晰 | 需要商户资质，国内需要企业账户或第三方聚合 |
| 订阅功能完整，SaaS 必备 | 手续费（2.9% + $0.30）相对国内聚合支付略高 |
| 全球覆盖，信用卡/本地支付全覆盖 | 争议（dispute）处理流程对新手有一定学习成本 |

---

## 5. 部署：Vercel + Railway

### 部署架构

```
┌─────────────────────────────────────────────────────┐
│  Vercel (Frontend + Serverless API)                 │
│  ├── Next.js Web App (SSG/SSR)                      │
│  ├── API Routes (Edge Functions)                     │
│  └── Media Storage (Vercel Blob / Cloudflare R2)     │
├─────────────────────────────────────────────────────┤
│  Railway (Background Jobs + Worker)                 │
│  ├── AI Task Workers (长文本处理队列)               │
│  └── Scheduled Tasks (定时任务)                     │
├─────────────────────────────────────────────────────┤
│  Supabase (Database + Auth + Storage + Edge Fn)     │
└─────────────────────────────────────────────────────┘
```

### Vercel 优缺点

| 优点 | 缺点 |
|------|------|
| 与 Next.js 原生集成，开发体验完美 | Serverless 计费，并发场景下可能产生意外费用 |
| 自动 HTTPS、自动 CDN、全球边缘节点 | 长时间运行的进程（>10s）场景受限 |
| Preview Deployment 每个 PR 自动生成预览环境 | 在国内访问速度不如国内云厂商 |

### Railway 优缺点

| 优点 | 缺点 |
|------|------|
| 支持任意 Docker 镜像，灵活性高 | 没有免费 tier，按量计费需注意监控 |
| 持久磁盘、自动重启，开箱即用的容器服务 | 规模上限比 AWS/K8s 低 |
| 部署简单，GitHub 集成，一键上线 | 国内访问延迟较高（建议配合 CDN） |

---

## 总结：技术选型一览

| 层级 | 技术选型 | 定位 |
|------|----------|------|
| 前端框架 | Next.js (App Router) | 主技术栈 |
| 前端托管 | Vercel | 主要部署 |
| 后端/数据库 | Supabase | 一站式后端 |
| AI - 主 | OpenAI GPT-4o | 内容生成核心 |
| AI - 备 | MiniMax Text-01 | 降本 + 国内访问 |
| 支付 | Stripe | 全球收款 |
| 后台任务 | Railway | Worker / 队列 |

---

*最后更新：2026-03-22*
