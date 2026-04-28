---
title: "Hello FixIt：搭建我的全新博客"
date: 2024-01-15T10:30:00+08:00
draft: false
author: "星云"
description: "记录使用 Hugo FixIt 主题搭建个人博客的全过程，包括主题安装、配置优化和内容管理。"
images: ["/images/posts/hello-fixit-cover.png"]
tags: ["Hugo", "FixIt", "博客搭建"]
categories: ["技术笔记"]
collections: ["博客系列"]
comment: true
---

## 为什么选择 FixIt？

在众多的 Hugo 主题中，[FixIt](https://github.com/hugo-fixit/FixIt) 以其丰富的功能和优雅的界面脱颖而出。它不仅提供了完整的博客基础功能，还内置了许多高级特性：

- 全文搜索（Fuse.js / Algolia）
- PWA 离线支持
- 数学公式渲染（KaTeX / MathJax）
- Mermaid 图表
- 内容加密
- 多语言支持
- 代码块复制/下载/全屏

## 快速开始

### 安装 Hugo

首先需要安装 Hugo（推荐 Extended 版本）：

```bash
# macOS
brew install hugo

# Windows
winget install Hugo.Hugo.Extended

# 验证安装
hugo version
```

### 创建站点

```bash
hugo new site my-blog
cd my-blog
git init
git submodule add https://github.com/hugo-fixit/FixIt.git themes/FixIt
```

### 配置主题

编辑 `hugo.toml`，启用 FixIt 主题：

```toml
theme = ["FixIt"]
```

### 创建内容

```bash
hugo new content posts/hello-fixit.md
```

## 配置亮点

### 搜索功能

FixIt 支持多种搜索引擎，我选择使用 **Fuse.js** 实现本地搜索：

```toml
[params.search]
enable = true
type = "fuse"
placeholder = "搜索文章..."
```

记得在 `outputs.home` 中添加 `"search"`，以生成搜索索引文件。

### 代码高亮

主题内置了精美的代码块样式，支持多种模式：

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, FixIt!")
}
```

配置 `mode = "mac"` 可以获得类似 Mac 窗口的代码块外观。

### PWA 支持

开启 PWA 后，博客可以被安装为桌面应用：

```toml
[params]
enablePWA = true
```

## 总结

FixIt 主题功能强大且易于定制，无论是技术博客还是个人笔记，都能很好地满足需求。如果你也在寻找一个优秀的 Hugo 主题，不妨试试 FixIt！

---

*本文最后更新于页面底部显示的时间戳*
