---
title: "个人简历"
date: 2025-01-01T00:00:00+08:00
draft: false
author: "星云"
description: "王海伟 - 前端开发工程师个人简历"
images: []
tags: ["简历", "前端"]
categories: ["关于"]
comment: false
---

## 基本信息

| 项目 | 内容 |
| :--- | :--- |
| **姓名** | 王海伟 |
| **性别/年龄** | 男 / 29 岁 |
| **籍贯** | 聊城 |
| **手机** | 13219731161 |
| **邮箱** | 969236713@qq.com |
| **工作年限** | 6 年 |
| **求职意向** | 前端开发工程师 |
| **期望城市** | 武汉 |

---

## 个人优势

- 深耕 **React 技术栈**，具备大型 **车联网（TSP）平台**、**新能源监控平台**、**AI Agent 智能体平台** 的完整前端建设经验。
- 熟悉 **企业级中后台** 与 **移动端 H5** 双端开发，能根据业务场景选用 **Umi / Vite** 等不同技术底座。
- 具备 **微前端（Qiankun）** 架构落地经验，主导过多子应用集成与独立部署方案。
- 擅长 **数据可视化**（ECharts / AntV / BizCharts / ReactFlow）与 **低代码表单设计器**（Designable / Formily）的工程化实现。
- 重视前端工程化与性能优化，熟悉 **TypeScript**、代码规范（ESLint / Prettier / Stylelint）、**CI/CD 镜像构建**、**包体积分析** 与 **浏览器兼容** 方案。
- 具备丰富的 H5 跨端开发经验，精通 H5 与小程序、App WebView 的通信机制及兼容性调优。
- 拥有音视频通话及智能客服系统的集成与业务落地经验。
- 能够针对浏览器渲染和网络加载进行深度优化，显著提升首屏速度与交互响应度。

---

## 技术栈

| 领域 | 技术 |
| :--- | :--- |
| **核心框架** | React 18、Umi 3 / Umi Max、Vite、Vue 2/3、TypeScript、JavaScript (ES6+) |
| **状态管理** | Dva、Redux、Pinia、Vuex、TanStack Query (React Query)、React Hooks |
| **UI 与样式** | Ant Design (v4/v5)、ProComponents、ProLayout、Element-Plus、Less、Scss、Styled-Components、Tailwind CSS |
| **微前端** | Qiankun（@umijs/plugin-qiankun） |
| **可视化** | ECharts（含 GL / Liquidfill）、BizCharts、AntV DataSet、ReactFlow、html2canvas |
| **低代码** | Designable、Formily（@formily/reactive） |
| **富文本 / 文档** | WangEditor、Braft Editor（Draft.js）、react-pdf、pdfjs-dist、xlsx、js-export-excel |
| **地图** | 腾讯地图（qqmap）、高德地图（AMap JS API）、天地图 (Tianditu) |
| **工程化** | Webpack、Vite SWC、ESLint、Prettier、Stylelint、husky、lint-staged、Docker、Nginx |
| **测试** | Jest、Puppeteer（E2E）、PHPUnit、SimpleTest、Qunit |
| **工具库** | Axios、Lodash、Day.js / Moment、ahooks、js-cookie、crypto-js、qrcode |
| **性能优化** | 代码分割、Tree Shaking、包体积分析（ANALYZE）、Vite Legacy、postcss-pxtorem、页面 Keep-Alive |
| **实时通信** | WebSocket、WebRTC、SSE |
| **跨端开发** | H5、小程序、App WebView、企业微信 |
| **版本管理** | Git、Svn |

---

## 工作经历

### 诚迈科技 — 前端开发工程师（2025.09 ~ 至今）

**公司背景**：岚图汽车 / 车联网与数字化平台

- 负责岚图汽车 **车联网云平台（TSP Portal）**、**新能源监控平台（EVM）**、**AI Agent 智能体平台** 等核心系统的前端架构与开发。
- 主导多个子系统从 0 到 1 的前端基建，包括技术选型、工程化规范、组件库沉淀与微前端改造。
- 推动团队代码规范落地，配置 ESLint + Prettier + Stylelint + husky + lint-staged，统一多项目开发体验。
- 针对车载场景与老旧车机浏览器，制定 **Vite + SWC + @vitejs/plugin-legacy** 构建方案，提升编译速度与运行兼容性。

#### 项目一：AI Agent 智能体平台（Portal + 车端 H5）

**项目背景**：面向用户与车机的 AI 智能体技能管理平台，支持对话式交互、技能可视化编排与车端轻量应用。

**技术栈**：`Umi Max` · `React 18` · `TypeScript` · `Ant Design X` · `ReactFlow` · `Vite` · `TanStack Query` · `Less`

**职责与亮点**：

- **Portal 端（agent-skill-portal）**：
  - 基于 **Umi Max + Ant Design X + Ant Design X Markdown** 构建 AI 对话门户，支持流式输出（SSE）与 Markdown 渲染。
  - 集成 **ReactFlow** 实现技能工作流的可视化拖拽编排，支持节点连线、配置面板与画布导出。
  - 使用 **html2canvas + react-to-pdf** 实现对话记录与工作流报告的 PDF 导出。
  - 基于 **@dnd-kit** 实现列表排序与卡片拖拽交互；使用 **flv.js** 支持视频直播流播放。
- **车端 H5（agent-skill-vehicle-app）**：
  - 采用 **Vite + React + SWC** 构建，编译速度显著提升；通过 **@vitejs/plugin-legacy** 兼容车机老旧浏览器。
  - 使用 **TanStack Query** 进行服务端状态管理，封装 Axios 请求层，实现缓存、重试与自动刷新。
  - 配置 **postcss-pxtorem** 完成移动端 Rem 适配；集成 **granim / shadergradient** 实现动态渐变背景，提升视觉体验。
- **安全与合规性保障**：
  - 静态数据配置：严格按照新国标要求实现静态数据配置模块，通过前端强类型校验确保车辆参数录入的合规性。
  - APK 安全校验：实现上传包的 MD5 与签名验证功能，在前端即时反馈安装包完整性，避免无效文件上传占用带宽和服务器资源。

#### 项目二：岚图车联网云平台 & 新能源监控平台（VOYAH TSP / DCVP / EVM）

**项目背景**：岚图汽车核心车联网业务系统，涵盖车辆监控、新能源电池管理、试验车追踪、低代码表单设计等多条业务线。

**技术栈**：`Umi 3` · `React` · `TypeScript` · `Qiankun` · `Ant Design` · `ECharts` · `BizCharts` · `Designable` · `Formily` · `Docker`

**职责与亮点**：

- **微前端架构**：基于 **@umijs/plugin-qiankun** 将多个子系统（dcvp.portal.web / dcvp.evm.portal.web / voyah.portal.core.web 等）拆分为独立应用，实现独立开发、独立部署、统一集成。
- **可视化与地图**：
  - 使用 **ECharts（含 ECharts GL、Liquidfill）+ BizCharts + AntV DataSet** 搭建车辆数据监控大屏、电池状态可视化、轨迹热力图。
  - 集成 **腾讯地图（qqmap）** 与 **高德地图（AMap JS API）**，实现车辆实时定位、轨迹回放与地理围栏。
- **低代码表单设计器**：基于 **Designable + Formily** 自研拖拽式表单设计器，支持组件拖拽、属性配置、Schema 生成与渲染，降低运营页面开发成本。
- **文档与报表**：集成 **WangEditor / Braft Editor** 实现富文本内容发布；使用 **xlsx / js-export-excel** 实现前端 Excel 导出；基于 **react-pdf / pdfjs-dist** 实现 PDF 在线预览。
- **工程化与部署**：配置多环境构建脚本（dev / test / pre / prod）；接入 **ANALYZE** 进行包体积分析；配合 **Docker** 与 Nginx 完成镜像构建与容器化部署。

#### 项目三：运营后台与 SOA 门户系统（Backstage / SOA Portal）

**项目背景**：企业内部运营后台与对客门户系统，承载用户管理、内容运营、数据配置、权限控制等中后台能力。

**技术栈**：`Umi 3` · `React Hooks` · `Dva` · `TypeScript` · `Ant Design 4` · `ProLayout` · `ahooks`

**职责与亮点**：

- **中后台基建**：基于 **Umi 3 + Dva + TypeScript + Ant Design 4** 搭建企业级中后台，使用 **ProLayout** 统一页面布局与菜单权限。
- **页面缓存**：引入 **umi-plugin-keep-alive / react-activation** 实现页面级状态缓存，解决表单填写与列表切换时的状态丢失问题。
- **安全与权限**：基于 **JWT + jsonwebtoken + crypto-js** 实现登录鉴权与敏感信息加密；前端实现滑块验证码（rc-slider-captcha）与路由级权限控制。
- **交互增强**：使用 **react-beautiful-dnd** 实现表格/卡片拖拽排序；集成 **Swiper** 与 **video-react** 实现多媒体内容展示。
- **数据埋点**：接入 **神策 SDK（sa-sdk-javascript）**，封装埋点 Hooks，实现页面浏览、按钮点击等用户行为分析。
- **规范落地**：统一配置 ESLint、Prettier、Stylelint 与 husky 预提交钩子，保障多人协作时代码风格与质量。

---

### 信华信技术有限公司 — 前端开发工程师（2023.03 ~ 2025.09）

#### 项目一：华为政企与运营商融合客服中心 (Ams 小组)

**技术栈**：Vue 3, TypeScript, Pinia, WebRTC, Vite, Scss

**项目背景**：支撑政企及运营商核心售后业务，通过跨端（H5/小程序/App）集成，提供音视频通话与 AI 智能客服生态。

**核心职责**：

- **AI 中心与大模型集成**：
  - 负责 AI 对话模块开发，基于 SSE (Server-Sent Events) 技术实现大模型回复的流式分块输出，处理长文本渲染卡顿问题，优化了交互体验。
  - 开发 AI 向量库管理系统，支持文档（PDF/Word 等）与矢量数据上传。实现文件分片上传与校验逻辑，打通了从用户上传文档到向量化处理的前端全链路。
- **Vue3 架构重构与治理**：负责进线咨询业务从 Vue2 JS 向 Vue3 TS 的平滑迁移。
  - 逻辑解耦：针对老项目中 EventBus 滥用、数据来源不明的痛点，通过 Vue3 Hooks + Pinia 重构底层状态机，实现逻辑复用与状态可追溯。
  - 类型安全：建立严格的 TS 类型定义体系，通过类型约束减少因接口变更引起的潜在 Bug，提升了复杂业务场景下的代码健壮性。
- **多渠道鉴权与兼容性适配**：
  - Webview 鉴权层设计：针对 H5 内嵌于微信小程序、原生 App（坤灵、亿企飞）的多入口场景，设计并实现了一次性凭证（Token）安全转移方案。通过拦截并解析 Webview 携带的动态凭证，实现了跨平台用户登录态的无缝同步与单点登录。
  - 多入口接入适配：统一处理不同宿主环境下 H5 入口注入、JS-Bridge 差异以及设备权限（摄像头/麦克风）申请策略，确保了音视频通话在多端表现的一致性。
- **WeCare 坐席端业务实现**：实现多渠道坐席进线匹配机制，有效处理小程序、PC、App 等多端并发进线的业务冲突。负责自主建单、通话触发自动建单、催单工作流等核心功能，并打通微信推送与售后进度评价闭环。
- **WeiKnow AI 智能客服开发**：负责 WeiKnow 智能机器人核心模块开发，实现 AI 引导式问答与智能问题分发。完成合规化闭环：小程序端手机号一键授权、隐私声明协议及其撤销逻辑、个人中心整改等核心功能，微信消息推送，确保系统符合最新的安全合规要求。

#### 项目二：企业级中台前端基座框架（核心开发 / 基座建设）

**技术栈**：Vue 3, Pinia, Element-Plus (二次封装), Iframe

**项目背景**：封装公司级统一前端脚手架，标准化权限、网关、配置等多个业务子模块的开发规范。

**核心职责**：

- **插件式动态路由系统**：基于 RBAC 模型设计，支持基础路由与业务模块路由分离注册，通过路由守卫实现了细粒度的动态权限校验。
- **UI 规范标准化**：基于 UI 设计稿对 Element-Plus 进行全局主题定制与二封组件库开发，沉淀了通用的 Iframe 布局、数据字典筛选器等高频组件以及 Hooks，降低了 30% 以上的重复开发成本。
- **中台模块建设**：负责网关管理（路由、卡片管理）、系统配置、基础数据、权限模块等核心及基于 ECharts 的业务基础数据可视化模块开发。

#### 项目三：IMC 资源运营及数字化作战平台（项目迁移与优化）

**技术栈**：Vue 3, Vite, ECharts, Element-Plus

**项目背景**：负责多个核心存量系统（无线质管、任务助手等）从 Webpack+Vue2 向 Vite+Vue3 的现代化改造。

**核心职责**：

- **工程化效能提效**：主导多个项目从 Webpack 迁移至 Vite，通过优化预构建链路，显著提升了开发环境的启动与热更新速度。
- **存量系统平滑过渡**：完成 ECharts、ElementUI 等多项核心依赖的 Vue3 适配，解决迁移过程中因框架差异导致的疑难 Bug，确保了老旧系统在现代架构下的稳定性。
- **数字化模块**：在 IMCResource 项目中，负责人员资源池、PO/POT 管理等全流程业务开发，利用数据可视化辅助资源配置决策。

---

### 航天能源 — 前端开发工程师（2020.12 ~ 2023.02）

#### 佛燃能源智慧管理平台

**项目描述**：该项目是佛燃能源核心的数字化运营平台，集成预付费交易、表具全生命周期管理、实时报警监控及外勤工单体系。系统通过 MQTT 协议承载万级终端设备的实时数据上报，旨在打造高可靠、高响应的能源监控与业务闭环系统。

**核心职责与技术实现**：

- **高并发实时监控架构**：主导报警中心重构。设计了基于 WebSocket 的心跳检测与断线重连机制，以及轮询报警推送，达到双重保障，保障了安全报警的秒级响应。
- **复杂业务中台构建**：独立负责预付费、表具管理、账单与发票控制器等核心业务模块。封装了高复用的通用业务组件库，提升了后续功能模块 30% 的开发效率和 50% 的维护便捷性。
- **GIS 可视化集成**：深度集成天地图 (Tianditu)，实现能源场站的地理信息标注、动态报警打点及可视化巡检路径规划，增强了空间数据的交互直观性。
- **移动端混合开发**：负责企业微信侧工单系统的开发，涵盖任务下发、现场核表、异常上报等功能。

**技术难点与性能调优**：

- **万级数据渲染性能突破**：针对后台一次性下发大数据量导致 `el-table` 渲染掉帧（甚至崩溃）的问题，全量重构为 `vxe-table` 虚拟列表方案。通过只渲染可视区域 DOM，将万级数据下的交互延迟从秒级降至 100ms 以内，确保了高负载下的 FPS 稳定。
- **深度内存溢出（OOM）治理**：针对 `keep-alive` 多页签场景下，因大数据量缓存导致的页面频繁崩溃问题，结合控制台日志分级屏蔽优化，彻底解决了系统长时间挂机运行后的内存泄漏问题，系统稳定性提升显著。
- **工程化指标优化**：针对全局控制台报错过载导致的渲染阻塞，建立了统一的错误拦截与静默处理机制，大幅降低了浏览器主线程的计算开销。

---

## 教育经历

| 学校 | 学历 | 专业 | 时间 |
| :--- | :--- | :--- | :--- |
| 乐山师范学院 | 本科 | 数字媒体技术应用 | 2015 ~ 2019 |

---

## 致谢

感谢您花时间阅读我的简历，期待能有机会和您共事。

---

*更新时间：2026-04-28*
