# 个人简历

> **岗位：前端开发工程师 / 高级前端工程师**

---

## 个人信息

|  |  |
| :--- | :--- |
| **姓名：** | [您的姓名] |
| **手机：** | [您的电话] |
| **邮箱：** | [您的邮箱] |
| **工作年限：** | [X] 年 |
| **Github / 博客：** | [可选] |

---

## 个人优势

- 深耕 **React 技术栈**，具备大型 **车联网（TSP）平台**、**新能源监控平台**、**AI Agent 智能体平台** 的完整前端建设经验。
- 熟悉 **企业级中后台** 与 **移动端 H5** 双端开发，能根据业务场景选用 **Umi / Vite** 等不同技术底座。
- 具备 **微前端（Qiankun）** 架构落地经验，主导过多子应用集成与独立部署方案。
- 擅长 **数据可视化**（ECharts / AntV / BizCharts / ReactFlow）与 **低代码表单设计器**（Designable / Formily）的工程化实现。
- 重视前端工程化与性能优化，熟悉 **TypeScript**、代码规范（ESLint / Prettier / Stylelint）、**CI/CD 镜像构建**、**包体积分析** 与 **浏览器兼容**方案。

---

## 技术栈

| 领域 | 技术 |
| :--- | :--- |
| **核心框架** | React 18、Umi 3 / Umi Max、Vite、TypeScript、JavaScript (ES6+) |
| **状态管理** | Dva、Redux、TanStack Query (React Query)、React Hooks |
| **UI 与样式** | Ant Design (v4/v5)、ProComponents、ProLayout、Less、Styled-Components、Tailwind CSS |
| **微前端** | Qiankun（@umijs/plugin-qiankun） |
| **可视化** | ECharts（含 GL / Liquidfill）、BizCharts、AntV DataSet、ReactFlow、html2canvas |
| **低代码** | Designable、Formily（@formily/reactive） |
| **富文本 / 文档** | WangEditor、Braft Editor（Draft.js）、react-pdf、pdfjs-dist、xlsx、js-export-excel |
| **地图** | 腾讯地图（qqmap）、高德地图（AMap JS API） |
| **工程化** | Webpack、Vite SWC、ESLint、Prettier、Stylelint、husky、lint-staged、Docker、Nginx |
| **测试** | Jest、Puppeteer（E2E） |
| **工具库** | Axios、Lodash、Day.js / Moment、ahooks、js-cookie、crypto-js、qrcode |
| **性能优化** | 代码分割、Tree Shaking、包体积分析（ANALYZE）、Vite Legacy、postcss-pxtorem、页面 Keep-Alive |

---

## 工作经历

### [公司名称] — 岚图汽车 / 车联网与数字化平台（推断）

**前端开发工程师** &nbsp;&nbsp; 2021.xx — 至今

- 负责岚图汽车 **车联网云平台（TSP Portal）**、**新能源监控平台（EVM）**、**AI Agent 智能体平台** 等核心系统的前端架构与开发。
- 主导多个子系统从 0 到 1 的前端基建，包括技术选型、工程化规范、组件库沉淀与微前端改造。
- 推动团队代码规范落地，配置 ESLint + Prettier + Stylelint + husky + lint-staged，统一多项目开发体验。
- 针对车载场景与老旧车机浏览器，制定 **Vite + SWC + @vitejs/plugin-legacy** 构建方案，提升编译速度与运行兼容性。

---

## 项目经历

### 1. AI Agent 智能体平台（Portal + 车端 H5）

**项目背景：** 面向用户与车机的 AI 智能体技能管理平台，支持对话式交互、技能可视化编排与车端轻量应用。

**技术栈：** `Umi Max` · `React 18` · `TypeScript` · `Ant Design X` · `ReactFlow` · `Vite` · `TanStack Query` · `Less`

**职责与亮点：**
- **Portal 端（agent-skill-portal）：**
  - 基于 **Umi Max + Ant Design X + Ant Design X Markdown** 构建 AI 对话门户，支持流式输出（SSE）与 Markdown 渲染。
  - 集成 **ReactFlow** 实现技能工作流的可视化拖拽编排，支持节点连线、配置面板与画布导出。
  - 使用 **html2canvas + react-to-pdf** 实现对话记录与工作流报告的 PDF 导出。
  - 基于 **@dnd-kit** 实现列表排序与卡片拖拽交互；使用 **flv.js** 支持视频直播流播放。
- **车端 H5（agent-skill-vehicle-app）：**
  - 采用 **Vite + React + SWC** 构建，编译速度显著提升；通过 **@vitejs/plugin-legacy** 兼容车机老旧浏览器。
  - 使用 **TanStack Query** 进行服务端状态管理，封装 Axios 请求层，实现缓存、重试与自动刷新。
  - 配置 **postcss-pxtorem** 完成移动端 Rem 适配；集成 **granim / shadergradient** 实现动态渐变背景，提升视觉体验。

---

### 2. 岚图车联网云平台 & 新能源监控平台（VOYAH TSP / DCVP / EVM）

**项目背景：** 岚图汽车核心车联网业务系统，涵盖车辆监控、新能源电池管理、试验车追踪、低代码表单设计等多条业务线。

**技术栈：** `Umi 3` · `React` · `TypeScript` · `Qiankun` · `Ant Design` · `ECharts` · `BizCharts` · `Designable` · `Formily` · `Docker`

**职责与亮点：**
- **微前端架构：** 基于 **@umijs/plugin-qiankun** 将多个子系统（dcvp.portal.web / dcvp.evm.portal.web / voyah.portal.core.web 等）拆分为独立应用，实现独立开发、独立部署、统一集成。
- **可视化与地图：**
  - 使用 **ECharts（含 ECharts GL、Liquidfill）+ BizCharts + AntV DataSet** 搭建车辆数据监控大屏、电池状态可视化、轨迹热力图。
  - 集成 **腾讯地图（qqmap）** 与 **高德地图（AMap JS API）**，实现车辆实时定位、轨迹回放与地理围栏。
- **低代码表单设计器：** 基于 **Designable + Formily** 自研拖拽式表单设计器，支持组件拖拽、属性配置、Schema 生成与渲染，降低运营页面开发成本。
- **文档与报表：** 集成 **WangEditor / Braft Editor** 实现富文本内容发布；使用 **xlsx / js-export-excel** 实现前端 Excel 导出；基于 **react-pdf / pdfjs-dist** 实现 PDF 在线预览。
- **工程化与部署：** 配置多环境构建脚本（dev / test / pre / prod）；接入 **ANALYZE** 进行包体积分析；配合 **Docker** 与 Nginx 完成镜像构建与容器化部署。

---

### 3. 运营后台与 SOA 门户系统（Backstage / SOA Portal）

**项目背景：** 企业内部运营后台与对客门户系统，承载用户管理、内容运营、数据配置、权限控制等中后台能力。

**技术栈：** `Umi 3` · `React Hooks` · `Dva` · `TypeScript` · `Ant Design 4` · `ProLayout` · `ahooks`

**职责与亮点：**
- **中后台基建：** 基于 **Umi 3 + Dva + TypeScript + Ant Design 4** 搭建企业级中后台，使用 **ProLayout** 统一页面布局与菜单权限。
- **页面缓存：** 引入 **umi-plugin-keep-alive / react-activation** 实现页面级状态缓存，解决表单填写与列表切换时的状态丢失问题。
- **安全与权限：** 基于 **JWT + jsonwebtoken + crypto-js** 实现登录鉴权与敏感信息加密；前端实现滑块验证码（rc-slider-captcha）与路由级权限控制。
- **交互增强：** 使用 **react-beautiful-dnd** 实现表格/卡片拖拽排序；集成 **Swiper** 与 **video-react** 实现多媒体内容展示。
- **数据埋点：** 接入 **神策 SDK（sa-sdk-javascript）**，封装埋点 Hooks，实现页面浏览、按钮点击等用户行为分析。
- **规范落地：** 统一配置 ESLint、Prettier、Stylelint 与 husky 预提交钩子，保障多人协作时代码风格与质量。

---

## 教育背景

- **[学校名称]** — [专业]（[学历]） &nbsp;&nbsp; 20xx.09 — 20xx.06
  - 主修课程：[可填写计算机相关课程，如数据结构、操作系统、计算机网络等]

---

## 自我评价

- 对前端技术保持热情，关注 React 生态、低代码与可视化领域的新动态。
- 具备良好的业务理解能力，能将复杂的车联网/新能源/AI 业务需求转化为高可用、可维护的前端方案。
- 注重团队协作与知识沉淀，乐于推动工程化规范与组件复用，提升团队整体交付效率。

---

*更新时间：2026-04-28*
