#!/bin/bash

# karry.asia 一键发布脚本
# 用法：在项目根目录执行 ./publish.sh

set -e

cd "$(dirname "$0")"

echo "📦 检查改动..."
if git diff --quiet && git diff --cached --quiet; then
  echo "✅ 没有新改动，无需发布。"
  exit 0
fi

echo ""
git status --short
echo ""

# 自动生成 commit 信息
CHANGED=$(git diff --name-only 2>/dev/null; git diff --cached --name-only 2>/dev/null)
WORKS_CHANGED=$(echo "$CHANGED" | grep "content/works" | sed 's|src/content/works/||g' | sed 's|\.md||g' | tr '\n' ', ' | sed 's/,$//')

if [ -n "$WORKS_CHANGED" ]; then
  MSG="update: $WORKS_CHANGED"
else
  MSG="update: $(date '+%Y-%m-%d %H:%M')"
fi

echo "💬 Commit 信息：$MSG"
echo ""

# 1. 推到 GitHub（备份）
git add .
git commit -m "$MSG"
git push
echo "✅ GitHub 备份完成"

# 2. SSH 登录服务器，拉取最新代码并重新构建
echo ""
echo "🚀 部署到服务器..."
ssh -p 24020 root@160.202.231.11 << 'REMOTE'
  set -e
  cd /var/www/karry-portfolio
  git pull
  npm install --prefer-offline
  npm run build
  echo "✅ 构建完成"
REMOTE

echo ""
echo "🌐 上线：https://folio.karry.asia"
