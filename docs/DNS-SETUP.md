# DNS 配置指南

本指南说明如何将你的域名（如 `[你的域名]`）指向 GitHub Pages，使你的 AI Content Factory 落地页可通过自定义域名访问。

---

## 方式一：使用 CNAME（推荐）

适用于使用 `www` 子域名的网站，如 `www.[你的域名]`。

### 在域名注册商处添加 CNAME 记录

| 主机记录 | 记录类型 | 记录值                  |
|----------|----------|-------------------------|
| `www`    | CNAME    | `qingchen-boop.github.io` |

### GitHub Pages 端配置

1. 打开仓库 **Settings** → **Pages**
2. 在 **Custom domain** 输入框中填入你的域名，例如：`www.[你的域名]`
3. 点击 **Save**
4. 勾选 **Enforce HTTPS**（HTTPS 会在证书自动签发后可用，通常需要等待几分钟）

---

## 方式二：使用 Apex Domain（根域名）

适用于直接使用根域名如 `[你的域名]`（不带 www）。

> ⚠️ 根域名不能使用 CNAME，只能使用 A 记录或 ALIAS 记录。

### 在域名注册商处添加 A 记录

| 主机记录 | 记录类型 | 记录值              |
|----------|----------|---------------------|
| `@`      | A        | `185.199.108.153`   |
| `@`      | A        | `185.199.109.153`   |
| `@`      | A        | `185.199.110.153`   |
| `@`      | A        | `185.199.111.153`   |

> GitHub Pages 使用的 IP 地址范围为 `185.199.108.x` ~ `185.199.111.x`，建议全部四条 A 记录都添加以确保高可用。

### 可选：添加 AAAA 记录（IPv6 支持）

| 主机记录 | 记录类型 | 记录值              |
|----------|----------|---------------------|
| `@`      | AAAA     | `2606:50c0:8000::153` |
| `@`      | AAAA     | `2606:50c0:8001::153` |
| `@`      | AAAA     | `2606:50c0:8002::153` |
| `@`      | AAAA     | `2606:50c0:8003::153` |

### GitHub Pages 端配置

1. 打开仓库 **Settings** → **Pages**
2. 在 **Custom domain** 输入框中填入你的根域名，例如：`[你的域名]`
3. 点击 **Save**
4. 建议同时添加 `www.[你的域名]` 的 CNAME 记录，实现 `www` 和根域名双入口
5. 等待 DNS 传播完成后，勾选 **Enforce HTTPS**

---

## 截图说明：GitHub Pages 自定义域名设置界面

以下是你需要在 GitHub 仓库中操作的位置：

```
仓库主页
 └── Settings（右侧边栏） 
      └── Pages（左栏 "Code and automation" 下方） 
           ├── Source: Deploy from a branch
           ├── Branch: main, / (root) 
           └── Custom domain: [在此输入你的域名]
                ├── ☑️ Enforce HTTPS（等待证书签发后勾选）
                └── Save
```

**操作步骤：**
1. 进入仓库 → **Settings**
2. 左侧菜单找到 **Pages**
3. **Source** 选择 `Deploy from a branch`，Branch 选择 `main`，目录选择 `/ (root)`
4. 在 **Custom domain** 文本框中输入你的域名（例：`www.[你的域名]` 或 `[你的域名]`）
5. 点击 **Save**
6. 等待几分钟让 GitHub 自动验证域名并签发 SSL 证书
7. 证书就绪后，勾选 **Enforce HTTPS**
8. 状态栏会显示"Your site is published at https://[你的域名]"

---

## DNS 传播时间

DNS 更改通常需要 **10 分钟到 48 小时**才能完全生效，具体取决于：

- 你的域名注册商
- 你的 DNS 服务商
- TTL（Time To Live）设置

验证 DNS 是否生效：
```bash
# Windows
nslookup www.[你的域名]

# macOS / Linux
dig www.[你的域名]
```

查看 DNS 传播状态：https://dnschecker.org/

---

## 常见问题

**Q: CNAME 和 A 记录有什么区别？**
- CNAME 将域名指向另一个域名（如 `www.example.com` → `qingchen-boop.github.io`）
- A 记录直接将域名指向一个 IP 地址

**Q: 应该用哪种方式？**
- 如果只需要 `www` 子域名，用 CNAME
- 如果需要根域名 + www，需要同时配置 A 记录（根域名）和 CNAME（www）

**Q: 域名验证失败怎么办？**
- 确认 DNS 记录已正确添加
- 等待 48 小时让 DNS 完全传播
- 检查域名注册商是否要求额外验证（如 email 确认）
