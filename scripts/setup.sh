#!/bin/bash
# =============================================================================
# AI Content Factory — 一键初始化脚本
# AI Content Factory - One-Click Setup Script
# =============================================================================
# 使用方法 Usage:
#   curl -fsSL https://raw.githubusercontent.com/qingchen-boop/ai-content-factory/main/scripts/setup.sh | bash
#
# 或者本地执行:
#   bash scripts/setup.sh
# =============================================================================

set -e  # 遇到错误立即退出

# ─── 颜色定义 ────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ─── 打印函数 ────────────────────────────────────────────────────────────────
info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; }

header() {
  echo ""
  echo -e "${CYAN}══════════════════════════════════════════════════════${NC}"
  echo -e "${CYAN}  $1${NC}"
  echo -e "${CYAN}══════════════════════════════════════════════════════${NC}"
}

# ─── 检测前置条件 ────────────────────────────────────────────────────────────
check_prerequisites() {
  header "检查前置条件 / Checking Prerequisites"
  
  local missing=()
  
  # 检查 git
  if ! command -v git &> /dev/null; then
    missing+=("git")
  else
    success "git 已安装 ($(git --version | head -c 50))"
  fi
  
  # 检查 node
  if ! command -v node &> /dev/null; then
    missing+=("node")
  else
    success "Node.js 已安装 ($(node --version))"
  fi
  
  # 检查 npm
  if ! command -v npm &> /dev/null; then
    missing+=("npm")
  else
    success "npm 已安装 ($(npm --version))"
  fi
  
  # 检查 gh (GitHub CLI)
  if ! command -v gh &> /dev/null; then
    warn "GitHub CLI (gh) 未安装，建议安装以便自动化操作"
    warn "安装: https://cli.github.com/"
  else
    success "GitHub CLI 已安装 ($(gh --version | head -c 30))"
  fi
  
  if [ ${#missing[@]} -ne 0 ]; then
    error "缺少以下必需工具: ${missing[*]}"
    error "请先安装缺失工具后再运行此脚本"
    exit 1
  fi
  
  success "前置条件检查通过 ✓"
}

# ─── 克隆或更新仓库 ─────────────────────────────────────────────────────────
setup_repository() {
  header "克隆仓库 / Setting Up Repository"
  
  local repo_url="https://github.com/qingchen-boop/ai-content-factory.git"
  local local_dir="/root/.openclaw/workspace/ai-content-factory"
  
  # 检查是否已存在
  if [ -d "$local_dir/.git" ]; then
    info "仓库已存在于 $local_dir"
    read -p "是否拉取最新代码? [y/N]: " pull_confirm
    if [[ "$pull_confirm" =~ ^[Yy]$ ]]; then
      cd "$local_dir"
      git pull origin main
      success "代码已更新"
    else
      info "跳过代码更新"
    fi
  else
    info "正在克隆仓库..."
    git clone "$repo_url" "$local_dir"
    success "仓库克隆完成: $local_dir"
  fi
}

# ─── 安装依赖 ────────────────────────────────────────────────────────────────
install_dependencies() {
  header "安装依赖 / Installing Dependencies"
  
  local project_dir="/root/.openclaw/workspace/ai-content-factory"
  cd "$project_dir"
  
  if [ ! -f "package.json" ]; then
    warn "未找到 package.json，跳过 npm install"
    return
  fi
  
  info "正在安装 npm 依赖..."
  npm install
  
  # 检查 next.js 是否安装（常见模式）
  if [ -d "apps/web" ] && [ -f "apps/web/package.json" ]; then
    info "检测到 monorepo 结构 (apps/web)，安装 workspace 依赖..."
    npm install -w apps/web 2>/dev/null || true
  fi
  
  success "依赖安装完成 ✓"
}

# ─── 环境变量配置 ────────────────────────────────────────────────────────────
setup_env_file() {
  header "配置环境变量 / Setting Up Environment Variables"
  
  local project_dir="/root/.openclaw/workspace/ai-content-factory"
  local env_file="$project_dir/.env.local"
  
  info "环境变量文件: $env_file"
  
  if [ -f "$env_file" ]; then
    warn ".env.local 已存在，保留现有配置"
    ls -la "$env_file"
    return
  fi
  
  # 创建 .env.local 示例文件
  cat > "$env_file" << 'EOF'
# =============================================================================
# AI Content Factory — 环境变量配置
# =============================================================================
# 复制此文件为 .env.local 并填写实际值
# Copy this file to .env.local and fill in actual values
# =============================================================================

# ─── Supabase ────────────────────────────────────────────────────────────────
# 在 https://supabase.com/dashboard 创建项目后获取
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key-here

# ─── AI APIs ─────────────────────────────────────────────────────────────────
# OpenAI API Key: https://platform.openai.com/api-keys
OPENAI_API_KEY=sk-proj-your-openai-key-here

# MiniMax API Key (备份/国内访问)
MINIMAX_API_KEY=sk-cp-your-minimax-key-here

# ─── Stripe ──────────────────────────────────────────────────────────────────
# Stripe API Keys: https://dashboard.stripe.com/apikeys
STRIPE_SECRET_KEY=sk_test_your-stripe-secret-key
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_your-stripe-publishable-key
STRIPE_WEBHOOK_SECRET=whsec_your-webhook-secret

# ─── App Config ──────────────────────────────────────────────────────────────
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXT_PUBLIC_APP_NAME=AI Content Factory
EOF
  
  success ".env.local 创建完成 ✓"
  success "请编辑 $env_file 填写实际的环境变量值"
  echo ""
  info "查看 Supabase 配置指南: docs/infrastructure-setup.md"
  info "查看 Stripe 配置指南: docs/infrastructure-setup.md"
}

# ─── GitHub 远程配置检查 ─────────────────────────────────────────────────────
check_git_remote() {
  header "Git 远程仓库检查 / Checking Git Remote"
  
  local project_dir="/root/.openclaw/workspace/ai-content-factory"
  cd "$project_dir"
  
  if [ -d ".git" ]; then
    local remote_url=$(git remote get-url origin 2>/dev/null || echo "")
    if [ -n "$remote_url" ]; then
      success "远程仓库: $remote_url"
    else
      warn "未配置远程仓库"
      info "添加远程仓库:"
      echo "  git remote add origin https://github.com/qingchen-boop/ai-content-factory.git"
    fi
    
    local current_branch=$(git branch --show-current)
    success "当前分支: $current_branch"
  fi
}

# ─── 快速链接 ────────────────────────────────────────────────────────────────
show_next_steps() {
  header "下一步 / Next Steps"
  
  echo ""
  echo -e "  ${GREEN}1. 配置环境变量${NC}"
  echo -e "     编辑 ${CYAN}.env.local${NC} 填写 Supabase / Stripe / OpenAI 等密钥"
  echo ""
  echo -e "  ${GREEN}2. Supabase 初始化${NC}"
  echo -e "     参考 ${CYAN}docs/infrastructure-setup.md${NC} 执行数据库 SQL"
  echo ""
  echo -e "  ${GREEN}3. Vercel 部署${NC}"
  echo -e "     vercel login && vercel"
  echo "     或在 https://vercel.com 导入 GitHub 仓库"
  echo ""
  echo -e "  ${GREEN}4. Stripe 配置${NC}"
  echo -e "     创建产品和定价，配置 Webhook"
  echo ""
  echo -e "  ${GREEN}5. 开始开发${NC}"
  echo -e "     npm run dev"
  echo ""
  echo -e "  ${YELLOW}详细文档: docs/infrastructure-setup.md${NC}"
  echo ""
}

# ─── 主函数 ──────────────────────────────────────────────────────────────────
main() {
  echo ""
  echo -e "${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║     AI Content Factory — 一键初始化脚本            ║${NC}"
  echo -e "${CYAN}║     AI Content Factory — One-Click Setup            ║${NC}"
  echo -e "${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
  echo ""
  
  check_prerequisites
  setup_repository
  install_dependencies
  setup_env_file
  check_git_remote
  show_next_steps
  
  success "初始化完成！🎉"
}

# ─── 运行 ─────────────────────────────────────────────────────────────────────
main "$@"
