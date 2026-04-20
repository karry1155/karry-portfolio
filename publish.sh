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

git add .
git commit -m "$MSG"
git push

echo ""
echo "🚀 已推送！Cloudflare Pages 正在自动构建，约 1 分钟后生效。"
echo "   https://folio.karry.asia"
