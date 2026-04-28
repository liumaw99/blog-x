---
title: "FixIt 高级 Markdown 扩展特性"
date: 2024-04-05T16:30:00+08:00
draft: false
author: "Vibely"
description: "探索 FixIt 主题提供的高级 Markdown 扩展，包括 Admonition、任务列表、内容加密、脚注等。"
images: ["/images/posts/advanced-markdown-cover.png"]
tags: ["Markdown", "FixIt", "排版"]
categories: ["技术笔记"]
collections: ["博客系列"]
comment: true
---

## 引言

FixIt 主题在标准 Markdown 语法基础上，提供了许多强大的扩展功能，让文章排版更加丰富和灵活。

## Admonition 提示框

Admonition 是一种醒目的提示框，适合用于强调重要信息。

### 标准类型

{{< admonition note "注意" >}}
这是一个 **Note** 提示框，用于补充说明信息。
{{< /admonition >}}

{{< admonition tip "提示" >}}
这是一个 **Tip** 提示框，用于给出实用建议。
{{< /admonition >}}

{{< admonition info "信息" >}}
这是一个 **Info** 提示框，用于展示一般信息。
{{< /admonition >}}

{{< admonition warning "警告" >}}
这是一个 **Warning** 提示框，用于提醒潜在问题。
{{< /admonition >}}

{{< admonition danger "危险" >}}
这是一个 **Danger** 提示框，用于标识严重警告。
{{< /admonition >}}

### 可折叠的提示框

```markdown
{{</* admonition question "常见问题" true */>}}
点击可以展开/收起内容。
{{</* /admonition */>}}
```

{{< admonition question "常见问题" true >}}
这是一个可折叠的提示框，点击标题可以展开或收起内容，适合放置较长的补充说明。
{{< /admonition >}}

## 自定义任务列表

FixIt 支持自定义任务列表图标：

```markdown
- [x] 已完成的基础任务
- [ ] 待完成的普通任务
- [tip] 这是一个带有提示图标的任务
```

效果如下：

- [x] 已完成的基础任务
- [ ] 待完成的普通任务
- [tip] 这是一个带有提示图标的任务

## 脚注

脚注是学术写作中常用的引用方式[^1]。

[^1]: 这是第一条脚注的内容。

长文档中可以使用多个脚注[^2]，它们会自动编号并显示在页面底部。

[^2]: 这是第二条脚注的内容。

## 上标与下标

化学方程式：H~2~O 是水的化学式。

数学表达式：x^2^ + y^2^ = z^2^

## 高亮与删除

==这是高亮文本==，用于标记重点内容。

~~这是删除文本~~，用于表示已废弃的内容。

## 缩写

FixIt 支持 HTML 缩写标签，例如：<abbr title="HyperText Markup Language">HTML</abbr> 是网页的基础语言。

## 代码块增强

### 指定文件名

```go {title="main.go"}
package main

import "fmt"

func main() {
    fmt.Println("带文件名的代码块")
}
```

### 高亮指定行

```python {linenos=table, hl_lines=[2,4]}
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print(fibonacci(10))
```

## 内容加密

FixIt 支持对文章进行密码保护：

```markdown
---
password: 123456
message: "请输入密码查看内容"
---
```

被加密的内容只有在输入正确密码后才会显示。

## 总结

FixIt 主题的这些扩展功能极大地丰富了 Markdown 的表达能力，让技术博客的排版既专业又美观。善用这些特性，可以让你的文章更具可读性和互动性。

---

*本文最后更新于页面底部显示的时间戳*
