# karry-portfolio

## 项目用途

这是 Karry Shi 的个人作品集项目，技术栈是 Astro + Tailwind。

作品内容由 Markdown 驱动：在 `src/content/works/` 中新增作品文件，首页和详情页会自动生成。图片和视频资源放在 `public/images/`。代码推送到 GitHub 后会自动部署。


## 新增作品

按作品类型选择目录：

- `src/content/works/AI Video/`：AI 视频作品
- `src/content/works/Graphic/`：视觉设计作品
- `src/content/works/Website/`：网站作品

媒体资源放在：

- `public/images/`

新增作品 Markdown 模板：

```yaml
---
title: "作品标题"
category: ai-video # graphic-design / ai-video / website
cover: "/images/cover.png"
date: "2026-06-23"
tags: ["AI Video", "Jimeng"]
video: "/images/demo.mp4" # 可选
link: "https://example.com" # 可选
featured: true
---
正文直接写在 frontmatter 下方，支持 Markdown、图片和视频标签。
```

## 发布流程

```
git status
git add -A
git commit -m "Add new portfolio work"
git push origin main
```
推送到 GitHub 后会自动部署。


## 注意事项
视频文件建议小于 25 MiB。超过时先用 ffmpeg 压缩：
```
ffmpeg -y \
  -i input.mp4 \
  -c:v libx264 \
  -b:v 10M \
  -maxrate 10M \
  -bufsize 20M \
  -preset slow \
  -pix_fmt yuv420p \
  -c:a aac \
  -b:a 128k \
  -movflags +faststart \
  output.mp4
```


## 本地开发
```
npm install
npm run dev
npm run build
```