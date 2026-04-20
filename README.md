# karry.asia — Portfolio

Astro + Tailwind portfolio site, updated via Obsidian and auto-deployed to Cloudflare Pages.

## Local dev

```bash
npm install
npm run dev        # localhost:4321
npm run build      # builds to dist/
```

## How to add a new work from Obsidian

Create a new `.md` file in `src/content/works/`. Frontmatter template:

```yaml
---
title: "Project Title"
category: graphic-design   # or: ai-video
cover: "/images/your-image.jpg"   # or an external URL
date: "2026-04"
tags: ["Tag1", "Tag2"]
featured: false            # set true to highlight
video: "https://youtube.com/embed/..."   # optional, for AI video works
---

Project description here...
```

Then write the project body in Markdown below the frontmatter.

Images go in `public/images/`.

## Deploy flow

```
Obsidian (write/edit) → git commit → git push → Cloudflare Pages (auto build)
```

## Cloudflare Pages setup (one-time)

1. Go to https://dash.cloudflare.com → Pages → Create a project
2. Connect GitHub repo: `karry-portfolio`
3. Build settings:
   - Framework preset: **Astro**
   - Build command: `npm run build`
   - Build output directory: `dist`
4. Save and deploy

For custom domain `karry.asia`:
- Pages → Custom domains → Add domain → follow DNS instructions
