# 部署指南

本文档说明如何将 AI Content Factory 落地页部署到 GitHub Pages 并连接自定义域名。

---

## 第一步：启用 GitHub Pages

1. 进入 GitHub 仓库：**qingchen-boop/ai-content-factory**
2. 点击顶部的 **Settings**（设置）
3. 左侧菜单找到 **Pages**
4. 在 **Build and deployment** 部分：
   - **Source**：选择 **Deploy from a branch**
   - **Branch**：选择 **main**，目录选择 `/ (root)`
5. 点击 **Save**

> 💡 首次部署大约需要 1-2 分钟。完成后会显示"Your site is published"。

---

## 第二步：连接自定义域名

### 在 GitHub 端设置

1. 在 **Settings → Pages** 页面
2. 在 **Custom domain** 输入框中填入你的域名：
   - 如果使用根域名（如 `[你的域名]`），直接填入
   - 如果使用 www 子域名（如 `www.[你的域名]`），填入带 www 的版本
3. 点击 **Save**
4. 等待 GitHub 验证域名所有权（通常几秒到几分钟）
5. 验证通过后，勾选 **Enforce HTTPS**（HTTPS 证书由 GitHub 自动签发）

### 在域名服务商处配置 DNS

参见 [DNS-SETUP.md](./DNS-SETUP.md) 中的详细说明，添加相应的 A 记录或 CNAME 记录。

---

## 第三步：等待 DNS 传播

DNS 更改不会立即生效。传播时间取决于多个因素：

| 情况 | 预计时间 |
|------|---------|
| 首次配置 | 24-48 小时 |
| 更新现有 DNS | 10 分钟 - 24 小时 |
| 降低 TTL 后 | 几分钟 - 几小时 |

> ⚠️ **建议**：在修改 DNS 之前，先将域名的 TTL 值调低（如 300 秒），可以加快传播速度。

**验证 DNS 是否生效：**
```bash
dig www.[你的域名]

# 或使用在线工具
# https://dnschecker.org/
```

---

## 第四步：启用 HTTPS（强制 HTTPS）

当 GitHub 为你的域名签发 SSL 证书后：

1. 回到 **Settings → Pages**
2. 确认 **Custom domain** 已填写且显示 ✅ 绿色勾勾
3. 勾选 **Enforce HTTPS** 选项
4. 证书可能需要几分钟自动签发，期间该选项可能不可勾选

> 🔒 HTTPS 不仅是安全要求，Google 和浏览器也会优先推荐启用 HTTPS 的网站。

---

## 自动化部署

每次向 `main` 分支推送代码时，GitHub Actions 会自动：

1. 检出最新代码
2. 构建并生成 Pages 产物
3. 部署到 GitHub Pages

**推送触发部署：**
```bash
git add .
git commit -m "Update content"
git push origin main
```

大约 1-2 分钟后，你的网站将自动更新。可以在仓库的 **Actions** 标签页查看部署进度。

---

## 自定义域名配置位置总览

```
GitHub 仓库: qingchen-boop/ai-content-factory
  └── Settings
       └── Pages
            ├── Source: Deploy from a branch
            ├── Branch: main / (root)
            ├── Custom domain: [你的域名]  ← 在这里填入
            └── ☑️ Enforce HTTPS           ← 证书签发后勾选
```

---

## 常见问题

**Q: 部署失败怎么办？**
- 检查 **Actions** 标签页中的 workflow 运行日志
- 确认 `index.html` 存在且语法正确
- 确认 workflow 文件路径为 `.github/workflows/deploy.yml`

**Q: HTTPS 证书迟迟不签发？**
- 确认 DNS A 记录或 CNAME 已正确配置
- 确认 GitHub Pages 的 Custom domain 已保存
- 等待最多 48 小时

**Q: 可以使用多个自定义域名吗？**
- 可以，但建议只使用一个主域名
- GitHub Pages 支持根域名 + www 共存配置
