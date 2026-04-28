# AGENTS.md — 星云笔记 (Hugo FixIt 博客)

> 本文件面向 AI 编码助手。如果你不了解本项目，请先阅读此文件。

---

## 项目概述

**星云笔记** 是一个基于 [Hugo](https://gohugo.io/) 静态站点生成器构建的个人博客，使用 [FixIt](https://github.com/hugo-fixit/FixIt) 主题。博客主要记录技术学习心得与生活感悟，面向中文读者。

- **站点名称**: 星云笔记
- **默认语言**: 简体中文 (`zh-cn`)
- **作者**: 星云
- **主题**: FixIt (通过 Git 子模块引入)
- **Hugo 最低版本**: Extended 0.156.0

---

## 技术栈

| 层级 | 技术 |
|------|------|
| 静态站点生成器 | Hugo (Extended 版) |
| 主题 | FixIt v0.4.X |
| 样式 | SCSS / CSS3 (主题内置 + 自定义覆盖) |
| 搜索 | Fuse.js (本地全文搜索) |
| 数学公式 | KaTeX |
| 图表 | Mermaid.js |
| 字体 | 霞鹜文楷 (LXGW WenKai) + Fira Code |
| PWA | Service Worker (主题内置) |

---

## 项目结构

```
.
├── hugo.toml              # 站点主配置文件（全部配置集中在此）
├── archetypes/            # 内容模板
│   ├── default.md         # 默认页面模板
│   └── posts.md           # 文章模板
├── assets/                # 需要 Hugo 处理的资源
│   ├── css/
│   │   ├── _custom.scss   # 自定义样式（追加）
│   │   └── _override.scss # 覆盖主题变量（字体、页面宽度等）
│   └── js/
│       └── custom.js      # 自定义脚本（每页末尾执行）
├── content/               # 站点内容（Markdown）
│   ├── about.md           # 关于页面
│   └── tech/              # 技术文章目录
│       ├── hello-fixit.md
│       ├── advanced-markdown.md
│       ├── math-formulas.md
│       ├── mermaid-diagrams.md
│       ├── pwa-offline.md
│       └── ...
├── static/                # 静态文件（直接复制到输出目录）
│   └── images/
│       ├── avatar.svg     # 作者头像
│       └── og-image.svg   # Open Graph 默认图片
├── themes/
│   └── FixIt/             # FixIt 主题（Git 子模块）
├── data/                  # 数据文件（当前为空）
├── i18n/                  # 自定义国际化文件（当前为空，使用主题内置）
├── layouts/               # 自定义布局模板（当前为空，使用主题内置）
├── public/                # 构建输出目录（已加入 .gitignore）
├── resources/             # Hugo 构建缓存（已加入 .gitignore）
└── .gitmodules            # Git 子模块配置
```

### 内容分区 (Sections)

站点规划了三个主要文章分区：

- `tech` — 技术文章
- `life` — 生活随笔（当前无内容）
- `notes` — 学习笔记（当前无内容）

### 内容模板 (Archetypes)

创建新内容时，使用以下 Front Matter 模板：

```yaml
---
title: "{{ replace .File.ContentBaseName \"-\" \" \" | title }}"
date: {{ .Date }}
draft: true
author: "星云"
description: ""
images: []
tags: []
categories: []
collections: []
comment: true
---
```

---

## 构建与运行命令

### 前提条件

- 安装 Hugo **Extended** 版本（最低 0.156.0）
- 确保 Git 子模块已初始化：

```bash
git submodule update --init --recursive
```

### 常用命令

```bash
# 本地开发服务器（实时重载）
hugo server -D --disableFastRender --navigateToChanged

# 构建站点（输出到 public/）
hugo --gc --minify

# 创建新文章
hugo new content tech/my-new-post.md

# 清理构建缓存
rm -rf public/ resources/
```

> 由于 FixIt 主题作为 Git 子模块引入，**不要直接修改 `themes/FixIt/` 目录下的任何文件**，所有自定义应通过项目根目录的 `assets/`、`content/`、`hugo.toml` 等完成。

---

## 代码与内容风格指南

### Markdown 内容规范

1. **Front Matter**: 所有文章必须包含完整的前置元数据，author 固定为 `"星云"`。
2. **图片路径**: 使用绝对路径 `/images/...`，图片文件存放在 `static/images/`。
3. **分类体系**:
   - `tags` — 标签（可多个）
   - `categories` — 分类（可多个）
   - `collections` — 专题系列（可多个）
4. **草稿标记**: 未完成的文章设置 `draft: true`，发布时改为 `false`。
5. **数学公式**: 需要渲染数学公式的文章添加 `math: true`。
6. **评论开关**: 单篇文章可通过 `comment: true/false` 控制评论区域显示。

### 样式定制规范

- **`assets/css/_override.scss`**: 用于覆盖主题 SCSS 变量（如字体、主题色、页面宽度）。
- **`assets/css/_custom.scss`**: 用于追加自定义 CSS 规则（如动画、毛玻璃效果、滚动条样式）。
- **`assets/js/custom.js`**: 在每页末尾执行的自定义 JavaScript。

当前已定制的样式包括：
- 全局中文字体改为 **霞鹜文楷**
- 代码字体改为 **Fira Code**
- 导航栏/子菜单/搜索下拉框的 **毛玻璃 (backdrop-filter)** 效果
- 文章卡片悬停上浮效果
- 自定义滚动条样式
- 自定义 Admonition 和任务列表颜色

---

## 已启用的核心功能

以下功能在 `hugo.toml` 中已启用并经过配置：

| 功能 | 配置要点 |
|------|----------|
| PWA | `enablePWA = true`，输出格式包含 `offline` |
| 搜索 | Fuse.js 本地搜索，`outputs.home` 包含 `search` |
| 代码高亮 | Goldmark + Chroma，行号显示，Mac 风格代码块 |
| 数学公式 | KaTeX，`passthrough` 扩展启用（支持 `$...$` 和 `$$...$$`）|
| Mermaid 图表 | 手绘风格 (`look = "handDrawn"`)，安全级别 `loose` |
| Git 信息 | `enableGitInfo = true`，自动获取文件最后修改时间 |
| 面包屑导航 | 启用，显示首页入口 |
| 阅读进度条 | 顶部显示 |
| 不蒜子统计 | 启用 (`busuanzi`)，数据来源 `vercount.one` |
| Cookie 同意 | 启用 |
| 国际化 | 单语言站点（zh-cn），`enableTranslationMerge = false` |

---

## 测试策略

本项目为静态博客，无传统单元测试。测试主要通过以下方式进行：

1. **本地预览**: 使用 `hugo server -D` 在提交前检查文章渲染效果。
2. **构建验证**: 运行 `hugo --gc --minify` 确保无构建错误。
3. **链接与图片检查**: 发布前确认文章内的内部链接和图片路径正确。
4. **多端预览**: FixIt 主题为响应式设计，建议在桌面和移动视口下都进行预览。

---

## 部署说明

构建输出目录为 `public/`，可直接部署到任何支持静态站点的托管平台：

- **Vercel / Netlify / Cloudflare Pages**: 连接 Git 仓库，构建命令设为 `hugo --gc --minify`，输出目录设为 `public`。
- **GitHub Pages**: 使用 GitHub Actions 或手动将 `public/` 内容推送到 `gh-pages` 分支。
- **自有服务器**: `rsync -avz public/ user@server:/var/www/blog/`。

部署前务必确认：
- `baseURL` 在 `hugo.toml` 中已更新为实际域名
- `draft: false` 的文章才会被包含在正式构建中（生产构建不加 `-D` 参数）

---

## 安全注意事项

1. **主题子模块来源**: FixIt 主题通过 Git 子模块从 `https://github.com/hugo-fixit/FixIt.git` 引入，更新子模块前请确认上游仓库可信。
2. **外部链接**: 主题已自动为外部链接添加 `rel="noopener noreferrer nofollow"`，自定义脚本中无需重复处理。
3. **内容加密**: FixIt 支持文章密码保护（Front Matter 中设置 `password`），敏感内容可使用此功能。
4. **隐私配置**: 已启用 `enableDNT`（Do Not Track）和 YouTube 隐私增强模式。
5. **统计分析**: 当前所有第三方分析服务（Google Analytics、Baidu 等）均为关闭状态，如需启用请在 `hugo.toml` 中配置并注意合规性。

---

## 关键文件速查

| 文件 | 作用 |
|------|------|
| `hugo.toml` | 站点全部配置（菜单、主题参数、输出格式、隐私等） |
| `assets/css/_override.scss` | 覆盖主题 SCSS 变量 |
| `assets/css/_custom.scss` | 追加自定义 CSS |
| `assets/js/custom.js` | 页面级自定义脚本 |
| `archetypes/posts.md` | 新建文章的 Front Matter 模板 |
| `static/images/avatar.svg` | 作者头像 |
| `static/images/og-image.svg` | 默认社交分享图 |
| `themes/FixIt/hugo.toml` | 主题默认配置（参考用，不要修改） |

---

## 外部参考

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [FixIt 主题文档](https://fixit.lruihao.cn/zh-cn/documentation/)
- [FixIt 主题仓库](https://github.com/hugo-fixit/FixIt)
- [FixIt 快速开始](https://fixit.lruihao.cn/zh-cn/documentation/getting-started/quick-start/)
