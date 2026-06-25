---
title: "Haikou City Symbols — 海口城市符号滚动叙事网站"
category: website
cover: "/images/haikou-symbols/haikou-symbols-cover.jpg"
link: "https://haikou-symbols.karry.asia"
date: "2026-06-25"
tags: ["Website", "Scroll Animation", "AI Video", "City Symbols", "Cloudflare Pages"]
featured: true
---

这个项目是一次围绕海口城市符号的滚动叙事网页实验。我把骑楼、钟楼、老爸茶、云洞图书馆、海口湾、世纪大桥、港口和集装箱建筑等元素，整理成一套可连续观看的影像系统，再把它落成一个可以公开访问的网站。

它不是传统城市介绍页，也不是把一段视频直接嵌进网页。项目的重点是：让用户的滚动行为参与影像节奏，在关键帧停顿时读到城市信息，在过场动画里重新进入画面本身。点击页面顶部封面图可以直接访问发布站点：[haikou-symbols.karry.asia](https://haikou-symbols.karry.asia)。

## 项目起点

这个项目延续了我之前对“滚动控制影像”的兴趣，但主题从单一角色转向城市视觉系统。海口很容易被简化成热带海岛：椰树、沙滩、蓝天、海水。这些元素当然存在，但如果只停在这里，海口会变得和许多海南旅游图像没有差别。

我更想呈现的是一个有层次的海口：有骑楼老街和钟楼构成的侨乡记忆，有老爸茶和电动车构成的日常尺度，有云洞图书馆和世纪大桥构成的现代滨海公共空间，也有港口、轮渡和集装箱暗示的流动性。

## 符号系统

调研阶段我先把海口拆成几条线索：老城、海湾、热带日常和港口门户。最后进入网页的符号不是景点清单，而是这些线索的组合。

![海口城市符号与镜头参考](/images/haikou-symbols/haikou-symbol-system-reference.png)

骑楼和钟楼负责建立城市记忆；老爸茶、电动车和椰树把画面拉回日常生活；云洞图书馆、世纪大桥和帆船让城市从老街延伸到海湾；吊机、轮渡和集装箱则把海口作为琼州海峡门户的身份带入片尾。

这些元素被统一成低饱和、玩具感的 3D 视觉语言。这个选择不是为了把城市做得幼态，而是为了让复杂信息进入同一个轻量系统：地标、食物、交通、建筑和港口设施都能像模型一样被摆放、组合和继续扩展。

<p>
  <img src="/images/haikou-symbols/qilou-arcade.png" alt="骑楼符号" style="width: 19%; display: inline-block; margin-right: 1%;" />
  <img src="/images/haikou-symbols/laoba-tea.png" alt="老爸茶符号" style="width: 19%; display: inline-block; margin-right: 1%;" />
  <img src="/images/haikou-symbols/yundong-library.png" alt="云洞图书馆符号" style="width: 19%; display: inline-block; margin-right: 1%;" />
  <img src="/images/haikou-symbols/century-bridge.png" alt="世纪大桥符号" style="width: 19%; display: inline-block; margin-right: 1%;" />
  <img src="/images/haikou-symbols/container-building.png" alt="集装箱建筑符号" style="width: 19%; display: inline-block;" />
</p>

## 从视频到网页

主视觉先被生成成一条约 15 秒的连续视频。视频里包含多个前景掠过、主体停靠和场景切换：电动车经过骑楼，钟楼出现在水岸中央，椰树快速划过后露出云洞图书馆，桥索和帆船进入海湾画面，最后来到港口与集装箱建筑。

网页没有让视频自动循环，而是把它拆成 6 个关键停顿帧：

- 30 帧：骑楼与老爸茶
- 88 帧：钟楼
- 127 帧：云洞图书馆
- 186 帧：海湾桥影
- 240 帧：港口门户
- 360 帧：集装箱城市

用户每次滚动只推进一个章节。向下滚动时，当前文字从下到上逐行退出，同时视频立刻播放到下一停顿点；到达新关键帧后，新文字再从上到下逐行出现。向上滚动时则直接跳回上一关键帧，不做倒放，避免过场动画变成机械回放。

## 文字与画面的关系

这个页面最难的不是把文字放上去，而是决定什么时候不放文字。视频中有很多前景遮挡和快速运动，如果文字出现在主体被遮住的瞬间，画面会变得很吵，也会削弱滚动停顿的意义。

所以每一章的文字都只在主体相对清楚的停顿帧出现。01 的文字避开骑楼、老爸茶和电动车的主要视觉区域；03 避开云洞图书馆的圆洞；04 给桥索和帆船留出空间；06 最后回到左侧，避免压住集装箱建筑主体。

这种处理让网页更像一段可以暂停的短片，而不是一页铺满说明文字的城市介绍。

## 移动端与 Safari 修正

项目后期主要时间花在移动端。桌面浏览器里可行的 video seek，在 iOS Safari 上不一定会稳定显示首帧；如果只依赖 `preload="auto"`，刷新页面时可能出现背景视频不显示，必须手动重新加载资源才恢复。

最终的处理方式是：页面初始化时显式 `video.load()`，等待 metadata 后做一次静音 `play / pause`，再 seek 回第 0 帧，强制 Safari 完成首帧解码。同时移动端用非 passive 的 `touchmove` 接管 hero 滑动，在第 06 章之前禁止页面提前滑到下方正文，到达最后一章后再释放原生滚动。

这部分不是视觉上最显眼的工作，但它决定了作品能不能在真实手机浏览器里成立。

## 页面结构

完整网站分成两层：

第一层是全屏滚动叙事。用户从第 0 帧进入，通过滚动依次经过 6 个城市符号节点。顶部导航提供概念、符号、过程和中英文切换，右侧菜单可以直接跳转章节。

第二层是项目说明区。它补充了项目简介、城市符号总览、制作过程和后续可扩展版本。这里的作用不是重复 hero 文案，而是让作品集观看者理解这个网站背后的设计方法：从城市调研到符号提取，再到生成视频和网页实现。

## 发布

最终网站发布在：[haikou-symbols.karry.asia](https://haikou-symbols.karry.asia)。

项目源码托管在 [karry1155/haikou-symbols](https://github.com/karry1155/haikou-symbols)，并通过 Cloudflare Pages 部署。发布版保留了主视频、海报图、符号切图和项目文档，让这个项目不只是一个网页结果，也是一份可以继续迭代的城市符号系统。

## 产出内容

- 海口城市符号调研与视觉元素筛选
- 骑楼、钟楼、老爸茶、云洞图书馆、世纪大桥、港口等符号系统
- 15 秒预渲染主视觉视频
- 6 个关键帧停顿的滚动叙事网页
- 中英文切换、章节导航、预加载状态和移动端适配
- GitHub 仓库发布与 Cloudflare Pages 托管
- 公网访问地址 [haikou-symbols.karry.asia](https://haikou-symbols.karry.asia)
