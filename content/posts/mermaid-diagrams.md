---
title: "使用 Mermaid 绘制流程图与图表"
date: 2024-03-10T09:00:00+08:00
draft: false
author: "星云"
description: "详细介绍如何在 FixIt 博客中使用 Mermaid 语法绘制流程图、时序图、类图等各种图表。"
images: ["/images/posts/mermaid-cover.png"]
tags: ["Mermaid", "图表", "可视化"]
categories: ["技术笔记"]
collections: ["博客系列"]
comment: true
---

## 什么是 Mermaid？

[Mermaid](https://mermaid.js.org/) 是一个基于 JavaScript 的图表绘制工具，它使用类似 Markdown 的文本语法来生成图表。FixIt 主题内置了 Mermaid 支持，可以直接在 Markdown 中绘制各种图表。

## 流程图

以下是一个简单的登录流程图：

```mermaid
flowchart TD
    A[开始] --> B{用户已登录?}
    B -->|是| C[进入首页]
    B -->|否| D[显示登录页]
    D --> E[输入账号密码]
    E --> F{验证通过?}
    F -->|是| C
    F -->|否| G[显示错误信息]
    G --> E
    C --> H[结束]
```

## 时序图

展示系统交互的时序图：

```mermaid
sequenceDiagram
    autonumber
    participant U as 用户
    participant C as 客户端
    participant S as 服务器
    participant D as 数据库

    U->>C: 点击登录按钮
    C->>S: POST /api/login
    S->>D: 查询用户信息
    D-->>S: 返回用户数据
    S-->>C: 返回 Token
    C-->>U: 登录成功
```

## 类图

展示面向对象设计的类图：

```mermaid
classDiagram
    class Animal {
        +String name
        +int age
        +makeSound()
        +move()
    }
    class Dog {
        +String breed
        +fetch()
    }
    class Cat {
        +String color
        +climb()
    }
    Animal <|-- Dog
    Animal <|-- Cat
```

## 状态图

展示状态转换：

```mermaid
stateDiagram-v2
    [*] --> 待处理
    待处理 --> 处理中: 开始处理
    处理中 --> 已完成: 处理成功
    处理中 --> 失败: 处理失败
    失败 --> 待处理: 重试
    已完成 --> [*]
```

## 甘特图

项目进度规划：

```mermaid
gantt
    title 博客开发计划
    dateFormat  YYYY-MM-DD
    section 准备阶段
    需求分析           :a1, 2024-01-01, 3d
    技术选型           :a2, after a1, 2d
    section 开发阶段
    环境搭建           :b1, after a2, 2d
    主题配置           :b2, after b1, 5d
    内容编写           :b3, after b2, 7d
    section 上线阶段
    测试优化           :c1, after b3, 3d
    部署上线           :c2, after c1, 1d
```

## 饼图

数据占比展示：

```mermaid
pie title 博客内容分布
    "技术笔记" : 45
    "生活随笔" : 25
    "读书笔记" : 20
    "其他" : 10
```

## ER 图

数据库实体关系图：

```mermaid
erDiagram
    USER ||--o{ POST : writes
    USER {
        int id PK
        string username
        string email
        datetime created_at
    }
    POST {
        int id PK
        string title
        text content
        int author_id FK
        datetime published_at
    }
    POST ||--o{ TAG : has
    TAG {
        int id PK
        string name
    }
```

## 总结

Mermaid 让在博客中插入图表变得非常简单，无需借助外部工具，直接用文本描述即可生成专业的图表。配合 FixIt 主题的手绘风格（`look = "handDrawn"`），图表既美观又有特色。

---

*本文最后更新于 {{< lastmod >}}*
