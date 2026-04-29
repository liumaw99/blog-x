---
title: "Dockerfile 常用指令详解"
date: 2025-01-01T00:00:00+08:00
draft: false
author: "Vibely"
description: "整理 Dockerfile 常用指令、执行时机与编写建议。"
images: []
tags: ["Docker", "Dockerfile", "容器"]
categories: ["学习笔记"]
collections: []
comment: true
---

# Dockerfile 常用指令详解

`Dockerfile` 是用来构建 Docker 镜像的脚本文件。它通过一组指令描述镜像的构建过程，最终生成可运行的应用环境。

## 一、Dockerfile 基本结构

一个常见的 `Dockerfile` 例如：

```dockerfile
FROM nginx:1.27
LABEL maintainer="liumaw99@foxmail.com"

COPY dist/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

构建命令：

```bash
docker build -t my-nginx:1.0 .
```

## 二、常用指令

### 1. `FROM`

作用：指定基础镜像。

```dockerfile
FROM nginx:1.27
FROM node:20-alpine
```

说明：

- `Dockerfile` 通常以 `FROM` 开头。
- 若没有基础镜像，后续指令无法执行。
- 生产环境常选体积更小的镜像，如 `alpine` 版本。

### 2. `LABEL`

作用：给镜像添加元数据。

```dockerfile
LABEL maintainer="liumaw99@foxmail.com"
LABEL app="blog"
LABEL version="1.0.0"
```

常见用途：

- 标记作者
- 标记项目名
- 标记版本号

### 3. `ARG`

作用：定义构建时变量。

```dockerfile
ARG PORT=80
ARG NODE_ENV=production
```

构建时传值：

```bash
docker build -t myapp --build-arg PORT=8080 .
```

特点：

- 只在构建阶段可用。
- 容器运行后默认不可见。

### 4. `ENV`

作用：定义运行时环境变量。

```dockerfile
ENV PORT=80
ENV NODE_ENV=production
```

特点：

- 构建阶段可用。
- 容器启动后依然存在。
- 常用于配置端口、环境模式、时区等。

### 5. `WORKDIR`

作用：指定工作目录。

```dockerfile
WORKDIR /app
WORKDIR /app/src
```

说明：

- 后续的 `RUN`、`CMD`、`COPY`、`ADD` 等指令会基于该目录执行。
- 若目录不存在，会自动创建。

### 6. `COPY`

作用：将宿主机文件复制到镜像中。

```dockerfile
COPY package.json /app/
COPY dist/ /usr/share/nginx/html/
```

特点：

- 只做复制，不会自动解压压缩包。
- 日常开发中优先使用 `COPY`。

### 7. `ADD`

作用：功能类似 `COPY`，但能力更多。

```dockerfile
ADD app.tar.gz /app/
ADD https://example.com/demo.tar.gz /tmp/
```

特点：

- 可以自动解压本地压缩包。
- 也支持远程 URL。

注意：

- 因行为更复杂，通常推荐优先使用 `COPY`。
- 只有确实需要自动解压或远程资源时再考虑 `ADD`。

### 8. `RUN`

作用：在镜像构建阶段执行命令。

```dockerfile
RUN apt-get update -y
RUN apt-get install -y curl
```

更推荐合并写法：

```dockerfile
RUN apt-get update -y && apt-get install -y curl
```

说明：

- 每条 `RUN` 都可能形成新的镜像层。
- 合并命令可以减少层数、缩小镜像体积。

### 9. `CMD`

作用：指定容器启动时默认执行的命令。

```dockerfile
CMD ["nginx", "-g", "daemon off;"]
```

也可写成：

```dockerfile
CMD ["ls", "-R"]
```

说明：

- 一个 `Dockerfile` 最终只会生效一个 `CMD`。
- 若写多个，只有最后一个生效。
- `docker run` 追加命令时，可覆盖 `CMD`。

### 10. `ENTRYPOINT`

作用：指定容器启动时的主命令。

```dockerfile
ENTRYPOINT ["nginx"]
```

与 `CMD` 的关系：

- `ENTRYPOINT` 更像固定主命令。
- `CMD` 更像默认参数或默认启动命令。

组合示例：

```dockerfile
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
```

最终效果等价于：

```bash
nginx -g 'daemon off;'
```

### 11. `EXPOSE`

作用：声明容器打算使用的端口。

```dockerfile
EXPOSE 80
EXPOSE 3000
```

注意：

- `EXPOSE` 只是声明，不会自动完成端口映射。
- 真正对外发布端口，还需要 `docker run -p`。

### 12. `VOLUME`

作用：声明挂载点。

```dockerfile
VOLUME ["/data"]
```

说明：

- 常用于数据库、日志目录、上传目录。
- 让容器内重要数据脱离镜像层，便于持久化。

### 13. `USER`

作用：指定后续命令或容器运行时的用户。

```dockerfile
USER root
USER node
```

说明：

- 生产环境中尽量避免长期使用 `root`。
- 使用普通用户运行应用更安全。

### 14. `HEALTHCHECK`

作用：定义健康检查命令。

```dockerfile
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost/ || exit 1
```

说明：

- 可用于判断容器是否真正可用。
- 很适合 Web 服务、接口服务等场景。

### 15. `SHELL`

作用：指定后续命令使用的 shell。

```dockerfile
SHELL ["/bin/bash", "-c"]
```

适用场景：

- 某些命令依赖 `bash` 特性。
- 默认 shell 不满足复杂脚本执行需求。

## 三、Dockerfile 执行时机

可以按三个阶段理解：

### 1. 构建阶段执行

以下指令主要在 `docker build` 时执行：

- `FROM`
- `LABEL`
- `ARG`
- `COPY`
- `ADD`
- `WORKDIR`
- `RUN`

### 2. 启动阶段生效

以下指令主要在 `docker run` 启动容器时体现作用：

- `ENV`
- `CMD`
- `ENTRYPOINT`
- `EXPOSE`
- `VOLUME`
- `HEALTHCHECK`

### 3. 构建和运行都相关

例如：

- `ENV` 在构建与运行阶段都可见。
- `WORKDIR` 会影响构建阶段命令，也会影响容器默认工作目录。

## 四、一个前端项目的 Dockerfile 示例

### 1. Node 构建 + Nginx 部署

```dockerfile
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx:1.27-alpine

COPY --from=builder /app/dist/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

说明：

- 第一阶段负责编译前端资源。
- 第二阶段只保留构建产物和 Nginx 运行环境。
- 这是典型的多阶段构建方式，镜像更小、更干净。

## 五、常见面试点

### `RUN` 和 `CMD` 有什么区别？

- `RUN` 在构建镜像时执行。
- `CMD` 在容器启动时执行。

### `CMD` 和 `ENTRYPOINT` 有什么区别？

- `CMD` 更容易被 `docker run` 后面的命令覆盖。
- `ENTRYPOINT` 更适合定义固定启动程序。

### `COPY` 和 `ADD` 有什么区别？

- `COPY` 更单纯，只复制文件。
- `ADD` 可以自动解压、支持远程 URL。
- 实际开发中优先使用 `COPY`。

## 六、编写建议

### 1. 选择更小的基础镜像

例如优先考虑：

- `node:20-alpine`
- `nginx:alpine`
- `python:3.12-alpine`

### 2. 合并 `RUN` 命令

减少镜像层数量，降低体积。

### 3. 善用 `.dockerignore`

避免把无关文件打进镜像，例如：

```gitignore
node_modules
.git
dist
npm-debug.log
```

### 4. 只复制必要文件

先复制依赖清单，再安装依赖，再复制源码，有利于利用缓存：

```dockerfile
COPY package*.json ./
RUN npm install
COPY . .
```

### 5. 生产环境避免以 root 运行

安全性更高，也更符合生产规范。

## 七、小结

主公只需先记住下面这些最常用的指令：

- `FROM`：基础镜像
- `COPY`：复制文件
- `RUN`：构建时执行命令
- `WORKDIR`：工作目录
- `ENV`：环境变量
- `EXPOSE`：声明端口
- `CMD`：默认启动命令
- `ENTRYPOINT`：固定启动命令
- `VOLUME`：数据挂载点
- `HEALTHCHECK`：健康检查

若主公后续还要，末将可继续补一篇 `Dockerfile` 面试题专项，专讲多阶段构建、缓存命中、镜像瘦身与安全最佳实践。
