---
title: "为博客启用 PWA 离线访问"
date: 2024-05-18T11:00:00+08:00
draft: false
author: "星云"
description: "介绍如何为 Hugo FixIt 博客配置 PWA 支持，实现离线访问、添加到主屏幕等原生应用体验。"
images: ["/images/posts/pwa-cover.png"]
tags: ["PWA", "离线访问", "Web App"]
categories: ["技术笔记"]
collections: ["博客系列"]
comment: true
---

## 什么是 PWA？

**PWA（Progressive Web App，渐进式 Web 应用）** 是一种使用现代 Web API 开发的应用程序，它可以提供类似原生应用的用户体验：

- 📱 **可安装** — 可以添加到手机/电脑主屏幕
- 🌐 **离线访问** — 无网络时也能浏览已缓存内容
- 🔔 **推送通知** — 支持后台消息推送
- ⚡ **快速加载** — 利用 Service Worker 缓存资源

## FixIt 的 PWA 支持

FixIt 主题内置了完整的 PWA 支持，只需简单配置即可启用。

### 开启 PWA

在 `hugo.toml` 中添加：

```toml
[params]
enablePWA = true
```

### 配置应用图标

```toml
[params.app]
title = "星云笔记"
noFavicon = false
svgFavicon = "/favicon.svg"
iconColor = "#5bbad5"
tileColor = "#da532c"

[params.app.themeColor]
light = "#f8f8f8"
dark = "#252627"
```

### 离线页面

FixIt 会自动生成 `/offline/index.html` 页面，当用户离线且访问未缓存的内容时，会显示友好的离线提示。

确保在 `outputs.home` 中包含 `"offline"`：

```toml
[outputs]
home = ["html", "rss", "archives", "offline", "search"]
```

## Service Worker 工作原理

```
┌─────────────┐     ┌─────────────────┐     ┌─────────────┐
│   浏览器    │────▶│  Service Worker │────▶│   网络      │
└─────────────┘     └─────────────────┘     └─────────────┘
                           │
                           ▼
                    ┌─────────────┐
                    │  缓存存储   │
                    └─────────────┘
```

Service Worker 充当浏览器与网络之间的代理：

1. **首次访问**：从网络获取资源并缓存
2. **后续访问**：优先从缓存读取，必要时更新
3. **离线状态**：直接返回缓存内容

## 安装体验

### 桌面端

在 Chrome/Edge 浏览器中，地址栏右侧会出现安装图标：

<!-- 桌面安装提示图片 -->

### 移动端

在 Safari（iOS）或 Chrome（Android）中，可以通过"分享到主屏幕"功能安装：

<!-- iOS 安装步骤图片 -->

## 性能优化建议

### 图片懒加载

FixIt 默认支持图片懒加载，但建议对文章中的大图片进行压缩：

```toml
[imaging]
quality = 75
```

### 资源预加载

可以在自定义头部添加关键资源的预加载：

```html
<link rel="preload" href="/fonts/main.woff2" as="font" type="font/woff2" crossorigin>
```

### 缓存策略

合理设置缓存头部，让静态资源长期缓存：

```toml
[[server.headers]]
for = '/**'
[server.headers.values]
Cache-Control = 'public, max-age=31536000'
```

## 验证 PWA

使用 Chrome DevTools 的 **Lighthouse** 面板可以检测 PWA 合规性：

1. 按 `F12` 打开开发者工具
2. 切换到 **Lighthouse** 面板
3. 勾选 **PWA** 类别
4. 点击 **Analyze page load**

## 总结

通过 FixIt 主题的 PWA 支持，你的博客可以获得接近原生应用的用户体验。配置简单，收益巨大，强烈建议开启此功能。

---

*本文最后更新于页面底部显示的时间戳*
