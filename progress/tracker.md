# 📊 Cyclone DDS 学习进度追踪

> 最后更新：2026-01-23

## 📈 总体进度

| 指标 | 状态 |
|------|------|
| 当前阶段 | 阶段 1：基础入门 + 阶段 4：RTPS 协议深入 |
| 完成度 | 55% |
| 学习天数 | 2 天 |
| 会话次数 | 3 次 |

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
| QoS 策略详解 | ✅ | 2026-01-23 | RELIABILITY、DURABILITY、LIVELINESS、内联 QoS |
| Discovery 机制 | ✅ | 2026-01-23 | SPDP、SEDP 完整流程、内置端点 |
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
| RTPS 行为模块 | ✅ | 2026-01-23 | Stateless/Stateful Writer/Reader、状态机 |
| RTPS 发现模块 | ✅ | 2026-01-23 | SPDP、SEDP、内置端点配置 |
| DDS QoS 实现 | ✅ | 2026-01-23 | 内联 QoS、Content Filter、Coherent Sets |
| **PSM UDP/IP 映射** | ✅ | 2026-01-23 | 类型映射、子消息线路格式、端口计算 |
| 核心数据结构 | ❓ | - | 内部实现 |
| 内存管理 | ❓ | - | 资源优化 |

---

## 🎯 已掌握技能

<!-- 学习过程中掌握的具体技能，由 AI 自动更新 -->

### RTPS 协议理论
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

### RTPS 行为模块（新增）
- [x] 理解 StatelessWriter 与 StatefulWriter 的区别和状态机
- [x] 理解 StatelessReader 与 StatefulReader 的区别和状态机
- [x] 理解 ReaderProxy 和 WriterProxy 的作用
- [x] 理解 ChangeForReader 和 ChangeFromWriter 状态
- [x] 理解 nackResponseDelay、heartbeatResponseDelay 等协议参数
- [x] 理解为什么 Reliable + Stateless = 不支持

### Discovery 协议（新增）
- [x] 理解 SPDP 和 SEDP 的分层设计
- [x] 理解为什么 SPDP 用 Best-Effort，SEDP 用 Reliable
- [x] 理解 SPDPdiscoveredParticipantData 结构
- [x] 理解 leaseDuration 租约机制
- [x] 理解 metatrafficLocator 与 defaultLocator 的区别
- [x] 理解 availableBuiltinEndpoints 按需端点设计
- [x] 理解 SEDP 内置端点的配置流程

### 高级 DDS 特性（新增）
- [x] 理解 Writer Liveliness Protocol（三种 Liveliness 类型）
- [x] 理解 Content-filtered Topics 的 Writer/Reader 端过滤
- [x] 理解 Group Ordered Access（GROUP 序列号）
- [x] 理解 Coherent Sets（一致性集合和 ECS 消息）
- [x] 理解协议版本控制和可扩展性机制

### PSM UDP/IP 映射（新增）
- [x] 理解 PSM 的作用（PIM 到具体平台的映射）
- [x] 理解 UDP/IP 作为传输层的优势
- [x] 理解 EntityId 编码：高 2 位（用户/内置/厂商）+ 低 6 位（实体类型）
- [x] 理解预定义 EntityId 的具体值（SPDP/SEDP/ParticipantMessage）
- [x] 理解 ANNOUNCER/DETECTOR 命名风格（= Writer/Reader）
- [x] 理解 guidPrefix 前两字节必须是 vendorId
- [x] 理解 Time_t、Duration_t 的 NTP 格式表示
- [x] 理解 Locator_t 的 IPv4/IPv6 地址映射
- [x] 理解 ParameterList 的格式和可扩展性设计
- [x] 理解 ParameterId 空间分配（bit15 协议/厂商，bit14 忽略/必须理解）
- [x] 理解 SequenceNumberSet 位图编码（bitmapBase/numBits:bitmap）
- [x] 理解 Key 和 KeyHash 的关系（KeyHash 是 Key 的 16 字节摘要）
- [x] 理解 RTPS Header 固定 20 字节格式
- [x] 理解所有子消息的线路格式（Data、DataFrag、Heartbeat、AckNack 等）
- [x] 理解 DataFrag 分片字段（fragmentSize、fragmentsInSubmessage、sampleSize）
- [x] 理解 InfoDestination 允许一个消息发给多个 Participant

### 实践技能（待学习）
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

1. ~~PSM (Platform Specific Model) UDP/IP 映射的具体细节~~ ✅ 已学习
2. 端口号计算公式的完整细节（PB、DG、d0、d1 参数）
3. DDS Security 扩展如何与 RTPS 集成
4. 实际 Cyclone DDS 源码中的实现差异
5. 性能调优的具体参数和方法

---

## 📝 学习笔记索引

| 日期 | 会话 | 主题 | 链接 |
|------|------|------|------|
| 2026-01-20 | session-01 | RTPS 消息模块与行为模块入门 | [session-01](../sessions/2026-01-20-session-01.md) |
| 2026-01-23 | session-02 | RTPS 行为模块深入、Discovery、高级特性 | [session-02](../sessions/2026-01-23-session-02.md) |
| 2026-01-23 | session-03 | PSM UDP/IP 映射、子消息线路格式 | [session-03](../sessions/2026-01-23-session-03.md) |

---

## 状态说明

| 符号 | 含义 |
|------|------|
| ✅ | 已掌握 |
| 🔄 | 进行中 |
| ❓ | 待学习 |
| ⚠️ | 需复习 |
