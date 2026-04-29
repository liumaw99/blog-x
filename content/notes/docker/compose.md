---
title: "docker compose 基础用法"
date: 2025-01-01T00:00:00+08:00
draft: false
author: "Vibely"
description: "整理 docker compose 的核心概念、常用配置与日常命令。"
images: []
tags: ["Docker", "Compose", "容器编排"]
categories: ["学习笔记"]
collections: []
comment: true
---

# docker compose 基础用法

`docker compose` 用来定义和运行多个容器服务。对于前后端分离项目、数据库依赖项目、微型本地开发环境来说，它非常实用。

## 一、为什么要用 compose

如果一个项目只运行一个容器，直接用 `docker run` 即可。

但如果项目里有：

- Web 服务
- MySQL 数据库
- Redis 缓存
- Nginx 反向代理

这时单靠一堆 `docker run` 命令会越来越难维护。

`docker compose` 的优势在于：

- 用一个 `compose.yaml` 管理多个服务
- 可以统一启动、停止、重建
- 自动创建网络
- 便于定义端口、环境变量、卷挂载、依赖关系

## 二、基础文件结构

现代 Compose 推荐文件名：

- `compose.yaml`
- `compose.yml`

一个最简单的示例：

```yaml
services:
  nginx:
    image: nginx:1.27
    ports:
      - "8080:80"
```

启动：

```bash
docker compose up -d
```

## 三、常见配置项

### 1. `services`

定义服务列表。

```yaml
services:
  web:
    image: nginx:1.27
  redis:
    image: redis:7
```

每个服务最终都会对应一个或多个容器。

### 2. `image`

指定要使用的镜像。

```yaml
services:
  db:
    image: mysql:8
```

### 3. `build`

指定从本地 Dockerfile 构建镜像。

```yaml
services:
  app:
    build: .
```

也可以写详细形式：

```yaml
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
```

### 4. `container_name`

手动指定容器名。

```yaml
services:
  nginx:
    image: nginx:1.27
    container_name: my-nginx
```

说明：

- 日常学习环境可用。
- 团队协作或扩容场景下，不建议过度依赖固定容器名。

### 5. `ports`

配置端口映射。

```yaml
services:
  nginx:
    image: nginx:1.27
    ports:
      - "8080:80"
```

含义：

- 宿主机访问 `8080`
- 转发到容器内部 `80`

### 6. `environment`

定义环境变量。

```yaml
services:
  mysql:
    image: mysql:8
    environment:
      MYSQL_ROOT_PASSWORD: 123456
      MYSQL_DATABASE: demo
```

也可写成数组形式：

```yaml
environment:
  - NODE_ENV=production
  - PORT=3000
```

### 7. `env_file`

从外部文件读取环境变量。

```yaml
services:
  app:
    env_file:
      - .env
```

适合将配置与编排文件拆分管理。

### 8. `volumes`

配置数据卷或目录挂载。

```yaml
services:
  mysql:
    image: mysql:8
    volumes:
      - mysql-data:/var/lib/mysql

volumes:
  mysql-data:
```

绑定宿主机目录也很常见：

```yaml
services:
  app:
    volumes:
      - ./:/app
```

### 9. `networks`

让多个服务加入同一网络。

```yaml
services:
  web:
    image: nginx:1.27
    networks:
      - app-net

  redis:
    image: redis:7
    networks:
      - app-net

networks:
  app-net:
```

同一网络中的服务可以直接通过服务名互相访问。

### 10. `depends_on`

定义服务启动依赖。

```yaml
services:
  app:
    build: .
    depends_on:
      - mysql
      - redis

  mysql:
    image: mysql:8

  redis:
    image: redis:7
```

注意：

- `depends_on` 只保证启动顺序。
- 不保证被依赖服务已经“真正可用”。
- 更稳妥的做法是结合健康检查或应用侧重试机制。

### 11. `restart`

设置重启策略。

```yaml
services:
  app:
    image: myapp:latest
    restart: always
```

常见取值：

- `no`
- `always`
- `unless-stopped`
- `on-failure`

## 四、完整示例

下面是一个前端应用 + MySQL + Redis 的简化示例：

```yaml
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: blog-app
    ports:
      - "3000:3000"
    environment:
      NODE_ENV: production
      DB_HOST: mysql
      REDIS_HOST: redis
    depends_on:
      - mysql
      - redis
    networks:
      - app-net

  mysql:
    image: mysql:8
    container_name: blog-mysql
    environment:
      MYSQL_ROOT_PASSWORD: 123456
      MYSQL_DATABASE: blog
    volumes:
      - mysql-data:/var/lib/mysql
    networks:
      - app-net

  redis:
    image: redis:7
    container_name: blog-redis
    networks:
      - app-net

volumes:
  mysql-data:

networks:
  app-net:
```

## 五、常用命令

### 1. 启动服务

```bash
docker compose up
docker compose up -d
```

### 2. 停止服务

```bash
docker compose stop
```

### 3. 停止并删除容器、网络

```bash
docker compose down
```

如果连数据卷一起删：

```bash
docker compose down -v
```

### 4. 查看服务状态

```bash
docker compose ps
```

### 5. 查看日志

```bash
docker compose logs
docker compose logs -f
docker compose logs -f app
```

### 6. 重新构建并启动

```bash
docker compose up -d --build
```

### 7. 进入容器

```bash
docker compose exec app sh
docker compose exec mysql bash
```

### 8. 拉取最新镜像

```bash
docker compose pull
```

### 9. 查看配置展开结果

```bash
docker compose config
```

这个命令很适合排查 YAML 是否写对。

## 六、服务之间如何通信

在 Compose 中，同一个网络内的服务可以直接使用服务名通信。

例如：

- `app` 访问 MySQL 时，主机名写 `mysql`
- `app` 访问 Redis 时，主机名写 `redis`

而不是写宿主机 IP。

例如应用配置：

```env
DB_HOST=mysql
REDIS_HOST=redis
```

## 七、开发环境常见写法

前端项目开发时常这样挂载：

```yaml
services:
  web:
    image: node:20
    working_dir: /app
    volumes:
      - ./:/app
    ports:
      - "5173:5173"
    command: sh -c "npm install && npm run dev -- --host"
```

用途：

- 宿主机改代码，容器内同步生效
- 适合本地调试 Vite、Node、Nest 等项目

## 八、常见问题

### 1. `docker compose` 和 `docker-compose` 有什么区别？

- `docker compose` 是新版插件式命令。
- `docker-compose` 是旧版独立命令。
- 现在一般优先使用 `docker compose`。

### 2. 为什么容器启动了但应用连不上数据库？

原因常见有：

- 数据库还没初始化完成
- 应用把数据库地址写成了 `localhost`
- 端口或账号密码配置错误

### 3. Compose 会自动创建网络吗？

会。即使你不手动写 `networks`，Compose 也会为项目创建默认网络。

## 九、小结

主公若刚入门，只需先掌握这些关键点：

- `services`：定义服务
- `image` / `build`：镜像来源
- `ports`：端口映射
- `environment`：环境变量
- `volumes`：数据持久化
- `depends_on`：启动依赖
- `docker compose up -d`：启动
- `docker compose down`：停止并清理

若主公要，末将下一篇还能继续补 `Compose` 实战，例如 `Nginx + Spring Boot + MySQL` 或 `Next.js + PostgreSQL + Redis` 的完整示例。
