---
title: "AIGC 商业设计工作流练习"
slug: "aigc-commercial-design-workflow"
category: graphic-design
cover: "/images/aigc-workflow-tropical-landing-page.png"
date: "2026-04-26"
tags: ["AIGC Design", "Brand System", "Prompt Workflow"]
featured: true
---

这次练习想解决的不是“怎样让 AI 生成一张好看的图片”，而是怎样让生成结果继续被修改、放大、延展，并最终进入真实的设计交付流程。

单张图片可以很快带来视觉冲击，但商业设计通常还要面对更多问题：Logo 能不能转成可编辑资产，参考图里的气质能不能延展成一套品牌语言，服饰方案是否适合真实使用场景，多对象画面能不能保持结构一致。围绕这些问题，我把练习拆成了五个部分。

## 1. Logo 从材质探索到矢量资产

我先用同一个圆形文字构图探索 KARRY Logo 的不同材质方向。果冻、充气、奶油、毛绒和霓虹版本能够快速建立视觉印象，也方便比较品牌气质。

![KARRY 果冻材质 Logo](/images/aigc-workflow-logo-jelly.png)

![KARRY 充气材质 Logo](/images/aigc-workflow-logo-inflatable.png)

![KARRY 奶油材质 Logo](/images/aigc-workflow-logo-cream.png)

![KARRY 毛绒材质 Logo](/images/aigc-workflow-logo-plush.png)

![KARRY 霓虹材质 Logo](/images/aigc-workflow-logo-neon.png)

这些立体版本适合找方向，但它们仍然只是图片。Logo 真正要进入品牌使用，还需要能够修改颜色、调整轮廓、适配不同尺寸。因此我继续把它收敛成更简单的扁平版本，再转换为可编辑的矢量资产。

![KARRY 扁平矢量风格 Logo](/images/aigc-workflow-logo-flat.png)

![在矢量软件中编辑 KARRY Logo](/images/aigc-workflow-logo-vector-editable.png)

这一段练习让我更明确地看到：风格探索和最终交付不是同一步。AI 可以快速提供方向，但设计师还需要决定什么应该保留，什么需要被重新整理成可用资产。

## 2. 从情绪版提炼品牌语言

参考图的价值不只是“照着它生成一张类似的图”，而是从中提取色彩、气质、元素关系和构图语言。我以热带岛屿海岸的摄影方向作为情绪参考，结合热带水果、海岸、阳光和鲜艳色彩，生成了一个具有海岛气质的品牌 Logo。

![热带岛屿与水果主题 Logo](/images/aigc-workflow-tropical-logo.png)

随后，我继续沿用同一套颜色、字体气质和插画语言，把 Logo 延展成落地页模拟。这样做的重点不是单独得到一张 Logo 图和一张网页图，而是让它们看起来属于同一个品牌系统。

![热带品牌落地页模拟](/images/aigc-workflow-tropical-landing-page.png)

这一部分让我理解到，情绪版不只是灵感收集，它也可以成为视觉系统的起点。只要提炼得足够清楚，同一套设计语言就能继续进入 Logo、页面和更多品牌触点。

## 3. 让服饰设计回到真实场景

我最初根据热带海边参考图生成了一组灯芯绒五片帽。颜色和气质能够对应参考图，但灯芯绒材质偏厚、偏复古，在炎热海岛场景里并不理想。

![热带配色灯芯绒五片帽](/images/aigc-workflow-corduroy-cap.png)

于是我没有停在“图片已经好看”的阶段，而是重新考虑海岛消费场景中的遮阳、透气、轻便和年轻感，进一步尝试了空顶遮阳帽、泡棉网布卡车帽和速干宽檐遮阳帽。

![空顶遮阳帽设计](/images/aigc-workflow-straw-visor.png)

![泡棉网布卡车帽设计](/images/aigc-workflow-trucker-cap.png)

![速干宽檐遮阳帽设计](/images/aigc-workflow-sun-hat.png)

参考图可以锁定颜色和感觉，但它不能替代品类判断。设计是否成立，仍然要回到使用者、环境和产品本身。

## 4. 先锁结构，再处理颜色与材质

服装这类偏结构的设计，如果一次性要求 AI 同时处理版型、颜色、材质和细节，结果很容易失控。更稳定的方式是先生成技术线稿，先把结构锁定，再进行后续上色。

![夹克技术线稿](/images/aigc-workflow-jacket-line-drawing.png)

![夹克上色结果](/images/aigc-workflow-jacket-colored.png)

第一轮练习跑通了“先形后色”的流程，但款式和热带场景仍然不够贴合。经过进一步调研，我把方向改成更适合海岛氛围的热带印花度假衬衫，再重复线稿与上色的步骤。

![热带度假衬衫技术线稿](/images/aigc-workflow-resort-shirt-line-drawing.png)

![热带度假衬衫上色结果](/images/aigc-workflow-resort-shirt-colored.png)

这一步的核心不是生成哪一件衣服，而是把复杂问题拆开：先做形，再做色；先控制结构，再讨论材质和细节。每一步的目标越明确，结果越容易被判断和修正。

## 5. 多对象图要逐格描述

最后一部分练习是把一张 Macintosh Classic 参考图拆成电脑、键盘和鼠标三个独立图标。

![Macintosh Classic 参考图](/images/aigc-workflow-macintosh-reference.png)

第一版提示词只说明“左边是电脑，中间是键盘，右边是鼠标”，虽然整体方向正确，但对象比例、视角和构图控制都不够稳定。

![第一版 Macintosh 图标生成结果](/images/aigc-workflow-macintosh-first-attempt.png)

优化后，我先定义整个画布的比例、三等分面板、分隔线和背景，再为每一格单独描述对象的视角、外形、结构和限制。结果更接近一张可以继续使用的图标表。

![逐格描述后的 Macintosh 三格图标](/images/aigc-workflow-macintosh-panel-grid.png)

在结构稳定之后，我又继续尝试提取新的颜色，并把同一组对象转换成像素图标方向。

![Macintosh 像素图标配色结果](/images/aigc-workflow-macintosh-pixel-icons.png)

![Macintosh 像素图标三格排版](/images/aigc-workflow-macintosh-pixel-grid.png)

多对象画面不能只依赖总体风格词。总体要求适合控制气质，局部结构则需要逐格描述。这个方法可以整理成一份更通用的提示词框架：

```text
Canvas / layout:
[画布比例、几行几列、背景、分隔线、每格是否等宽、整体排列方式]

Left cell:
[对象身份、视角、外形、材质颜色、关键结构、必须包含或不能包含的细节]

Middle cell:
[对象身份、视角、外形、材质颜色、关键结构、必须包含或不能包含的细节]

Right cell:
[对象身份、视角、外形、材质颜色、关键结构、必须包含或不能包含的细节]

Global style:
[光照、风格、清晰度、阴影、无文字、无水印、无杂物]
```

## 复盘

这次练习真正想保留的不是某一张图片，而是一套更接近商业设计的思考方式：

- 先拆需求，再决定 AI 应该解决哪一步。
- 用参考图提炼设计语言，而不是只复制表面风格。
- 把结构、颜色、材质和细节拆开控制。
- 让单张视觉结果继续延展成页面、产品和图标系统。
- 对最终资产保持可编辑、可复用和可交付的意识。

会生图只是起点。图片是结果，真正能够复用的是流程。

## 参考视频

- [原始视频链接](https://v.douyin.com/jI79n33WXwc)
