# 域名策略 / Domain Strategy

> AI Content Factory — 域名规划文档

---

## 域名推荐列表

### 🏆 首选推荐（按优先级排序）

#### 1. aicontentfactory.com ⭐ 推荐

- **价格估算：** $12–18/年（Namecheap / GoDaddy 标准价）
- **品牌契合度：** ★★★★★ 直接描述产品，高辨识度
- **SEO 优势：** 关键词 "AI Content Factory" 完整命中，Google 直接匹配
- **可记忆性：** 较长但直观，适合 B2B 用户

#### 2. aifact.co  ⭐ 推荐

- **价格估算：** $20–35/年（短域名溢价）
- **品牌契合度：** ★★★★☆ 简洁有力，便于品牌化
- **SEO 优势：** "aifact" 可被索引，但不如完整词组明确
- **可记忆性：** 极短，适合社交媒体分享，适合出海产品
- **注意：** .co 是哥伦比亚国家域名，但已被全球科技公司广泛使用

#### 3. aigenstudio.com ⭐ 推荐

- **价格估算：** $10–20/年
- **品牌契合度：** ★★★★☆ "AI + Generate + Studio"，定位清晰
- **SEO 优势：** "AI generator" 相关搜索词命中，利于内容营销
- **可记忆性：** 中等，有 "工作室" 的创意感

#### 4. contentai.io

- **价格估算：** $8–15/年（.io 域名便宜）
- **品牌契合度：** ★★★☆☆ 偏技术风格
- **SEO 优势：** 一般，.io 域名 Google 权重与 .com 有差异
- **可记忆性：** 中等，.io 后缀在开发者社区受欢迎
- **适用场景：** 适合偏技术/工具定位的产品

#### 5. aicontent.app

- **价格估算：** $10–18/年
- **品牌契合度：** ★★★☆☆ "工具" 感强
- **SEO 优势：** 较弱，.app 域名相对新颖
- **可记忆性：** 中等，.app 暗示移动/应用属性
- **适用场景：** 偏 SaaS 工具属性的产品

---

## 域名比价表

| 域名 | 注册商推荐 | 首年价 | 续费/年 | .com 可用性 | 建议 |
|------|-----------|--------|---------|------------|------|
| aicontentfactory.com | Namecheap | ~$12 | ~$15 | ⚠️ 需抢/协商 | 高优先级 |
| aifact.co | Namecheap | ~$25 | ~$30 | ✅ | 高优先级 |
| aigenstudio.com | Namecheap | ~$12 | ~$15 | ✅ | 高优先级 |
| contentai.io | Cloudflare Registrar | ~$8 | ~$8 | ✅ | 备选 |
| aicontent.app | Google Domains | ~$12 | ~$15 | ✅ | 备选 |

---

## SEO 考虑

### 域名 SEO

| 域名 | 关键词命中 | 品牌词 | 难度评估 |
|------|-----------|--------|---------|
| aicontentfactory.com | "AI content factory" 完整命中 | ✅ 强品牌 | 高搜索量，低竞争 |
| aifact.co | "AI fact" 模糊命中 | ✅ 可塑 | 中等竞争 |
| aigenstudio.com | "AI generator" 相关 | ✅ 可塑 | 中等竞争 |
| contentai.io | "content AI" 命中 | ⚠️ 一般 | 低竞争 |

### SEO 建议

1. **首选 aicontentfactory.com** — 搜索 "AI content factory" 的用户直接命中
2. **建议同时注册 aifact.co** 作为短链/社交媒体专用
3. **品牌名与域名一致** — 避免混用，有助于积累域名权重
4. **配置 HTTPS** — Vercel 自动配置，无需额外操作
5. **提交 Google Search Console** — 域名验证后主动提交 sitemap

### 多域名策略

```
主域名: aicontentfactory.com  →  官网 / 主要产品
短域名: aifact.co            →  社交媒体 / 广告跳转 / UTM 追踪
备选:   aigenstudio.com       →  品牌保护（建议同时注册防抢注）
```

---

## 购买建议

1. **首选 Namecheap** — 价格透明，WHOIS 隐私免费，续费无隐藏费用
2. **备用 Cloudflare Registrar** — 价格低（.com $8.57/年），隐私保护好
3. **不要在 GoDaddy 购买** — 续费价格高，套路多
4. **同时注册 .com 和 .co** — 防止竞争对手抢注
5. **开启 WHOIS 隐私保护** — 防止垃圾邮件和域名劫持

---

## DNS 配置（Vercel 示例）

购买域名后，在 Vercel 中配置：

```
A 记录:  @  →  76.76.21.21 (Vercel 负载均衡 IP)
CNAME:   www  →  cname.vercel-dns.com
TXT:     @  →  vercel-domain-verification=xxxxxx
```

---

*最后更新：2026-03-22*
