# 📊 Cyclone DDS 学习进度追踪

> 最后更新：2026-01-20

## 📈 总体进度

| 指标 | 状态 |
|------|------|
| 当前阶段 | 阶段 1：基础入门 + 阶段 4：RTPS 协议深入 |
| 完成度 | 25% |
| 学习天数 | 1 天 |
| 会话次数 | 1 次 |

---

## 📚 模块学习状态

### 阶段 1：基础入门

| 模块 | 状态 | 完成日期 | 笔记 |
|------|------|----------|------|
| DDS 概念与架构 | ✅ | 2026-01-20 | 理解 DDS/RTPS 分层、PIM/PSM 模型 |
| 环境安装配置 | ❓ | - | 编译 Cyclone DDS |
| HelloWorld 示例 | ❓ | - | 第一个 DDS 程序 |
| 基本 API 使用 | ❓ | - | 创建实体、发布订阅 |

### 阶段 2：核心掌握

| 模块 | 状态 | 完成日期 | 笔记 |
|------|------|----------|------|
| IDL 数据类型定义 | 🔄 | - | 理解 Key、Instance、instanceHandle 概念 |
| QoS 策略详解 | 🔄 | - | 理解 RELIABILITY、DURABILITY、HISTORY、QoS 匹配规则 |
| Discovery 机制 | 🔄 | - | 了解 SPDP、SEDP 作用 |
| 自定义应用开发 | ❓ | - | 完整项目实践 |

### 阶段 3：进阶应用

| 模块 | 状态 | 完成日期 | 笔记 |
|------|------|----------|------|
| 性能调优 | ❓ | - | 延迟、吞吐量优化 |
| 安全配置 | ❓ | - | DDS Security |
| ROS 2 集成 | ❓ | - | rmw_cyclonedds |
| 多语言绑定 | ❓ | - | C++, Python |

### 阶段 4：深入源码/规范

| 模块 | 状态 | 完成日期 | 笔记 |
|------|------|----------|------|
| RTPS 协议规范 | 🔄 | - | 深入学习 DDS-RTPS 规范文档 |
| RTPS 结构模块 | ✅ | 2026-01-20 | Entity、HistoryCache、CacheChange、GUID |
| RTPS 消息模块 | ✅ | 2026-01-20 | 所有子消息类型详解 |
| RTPS 行为模块 | 🔄 | - | 开始学习互操作性要求 |
| 核心数据结构 | ❓ | - | 内部实现 |
| 内存管理 | ❓ | - | 资源优化 |

---

## 🎯 已掌握技能

<!-- 学习过程中掌握的具体技能，由 AI 自动更新 -->

- [x] 理解 DDS 与 RTPS 的关系和分层
- [x] 理解 PIM（平台无关模型）和 PSM（平台特定模型）
- [x] 理解 RTPS 实体层次结构（Domain → Participant → Group → Endpoint）
- [x] 理解 GUID 结构（GuidPrefix + EntityId）
- [x] 理解 HistoryCache 和 CacheChange 的作用
- [x] 理解 Key、Instance、instanceHandle 的关系
- [x] 理解 RTPS 消息结构（Header + Submessages）
- [x] 理解所有 RTPS 子消息类型及其用途
- [x] 理解 Entity Submessage 与 Interpreter Submessage 的区别
- [x] 理解可靠传输机制（HEARTBEAT/ACKNACK）
- [x] 理解大数据分片传输（DataFrag/HeartbeatFrag/NackFrag）
- [x] 理解 Gap 消息和 filteredCount 的作用
- [x] 理解内联 QoS（Inline QoS）的概念和用途
- [x] 理解 QoS 匹配规则（Writer Offered >= Reader Requested）
- [x] 理解 dispose() 和 unregister() 的区别
- [ ] 创建 Domain Participant
- [ ] 定义 Topic
- [ ] 创建 Publisher/Subscriber
- [ ] 创建 DataWriter/DataReader
- [ ] 发布数据
- [ ] 订阅数据
- [ ] 配置 QoS
- [ ] 使用 IDL 定义类型
- [ ] 配置 Discovery
- [ ] 性能调优

---

## ❓ 遗留问题

<!-- 学习中遇到的待解决问题 -->

1. RTPS 行为模块的 Stateless 和 Stateful 参考实现细节
2. Writer Liveliness Protocol 具体实现
3. Discovery 协议（SPDP/SEDP）的详细流程

---

## 📝 学习笔记索引

| 日期 | 会话 | 主题 | 链接 |
|------|------|------|------|
| 2026-01-20 | session-01 | RTPS 消息模块与行为模块 | [session-01](../sessions/2026-01-20-session-01.md) |

---

## 状态说明

| 符号 | 含义 |
|------|------|
| ✅ | 已掌握 |
| 🔄 | 进行中 |
| ❓ | 待学习 |
| ⚠️ | 需复习 |
