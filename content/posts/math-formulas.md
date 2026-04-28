---
title: "在博客中优雅地书写数学公式"
date: 2024-02-20T14:00:00+08:00
draft: false
author: "星云"
description: "介绍如何在 FixIt 博客中使用 KaTeX 和 MathJax 渲染数学公式，包括行内公式和块级公式。"
images: ["/images/posts/math-cover.png"]
tags: ["数学", "KaTeX", "LaTeX"]
categories: ["技术笔记"]
collections: ["博客系列"]
comment: true
math: true
---

## 引言

对于理工科博主来说，在文章中插入数学公式是刚需。FixIt 主题内置了对 **KaTeX** 和 **MathJax** 的支持，可以轻松渲染各种复杂的数学表达式。

## 行内公式

行内公式使用单个美元符号包裹，例如：

爱因斯坦的质能方程 $E = mc^2$ 揭示了质量与能量的等价关系。

欧拉公式 $e^{i\pi} + 1 = 0$ 被誉为最美的数学公式。

## 块级公式

块级公式使用双美元符号包裹：

$$
\int_{-\infty}^{+\infty} e^{-x^2} dx = \sqrt{\pi}
$$

二次方程的求根公式：

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

## 矩阵与行列式

矩阵表示：

$$
\mathbf{A} = \begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{bmatrix}
$$

行列式计算：

$$
\det(\mathbf{A}) = \begin{vmatrix}
a & b \\
c & d
\end{vmatrix} = ad - bc
$$

## 微积分

偏导数：

$$
\frac{\partial f}{\partial x} = \lim_{h \to 0} \frac{f(x+h, y) - f(x, y)}{h}
$$

多重积分：

$$
\iiint_V (\nabla \cdot \mathbf{F}) \, dV = \iint_S \mathbf{F} \cdot d\mathbf{S}
$$

## 概率统计

正态分布的概率密度函数：

$$
f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2}
$$

贝叶斯定理：

$$
P(A|B) = \frac{P(B|A) \cdot P(A)}{P(B)}
$$

## 线性代数

向量点积与叉积：

$$
\mathbf{a} \cdot \mathbf{b} = \sum_{i=1}^{n} a_i b_i
$$

$$
\mathbf{a} \times \mathbf{b} = \begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
a_1 & a_2 & a_3 \\
b_1 & b_2 & b_3
\end{vmatrix}
$$

## 总结

FixIt 主题的数学公式支持非常完善，无论是简单的行内公式还是复杂的多行对齐，都能完美渲染。对于学术写作和技术博客来说，这是一个不可或缺的功能。

---

*本文最后更新于 {{< lastmod >}}*
