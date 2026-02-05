# 📊 Cyclone DDS 学习进度追踪

> 最后更新：2026-02-04

## 📈 总体进度

| 指标 | 状态 |
|------|------|
| 当前阶段 | 阶段 1：基础入门 + 阶段 3：安全配置 + 阶段 4：源码学习 |
| 完成度 | **85%** |
| 学习天数 | 5 天 |
| 会话次数 | **8 次** |

---

## 📚 模块学习状态

### 阶段 1：基础入门

| 模块 | 状态 | 完成日期 | 笔记 |
|------|------|----------|------|
| DDS 概念与架构 | ✅ | 2026-01-20 | 理解 DDS/RTPS 分层、PIM/PSM 模型、共享数据空间设计哲学 |
| 环境安装配置 | 🔄 | - | 编译配置完成，理解 CMake 包配置机制 |
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
| 性能调优 | 🔄 | - | 理解异步写入、LatencyBudget QoS |
| 安全配置 | ✅ | 2026-02-04 | DDS Security 三大插件架构、DH 密钥交换、安全检查链 |
| ROS 2 集成 | ❓ | - | rmw_cyclonedds |
| 多语言绑定 | ❓ | - | C++, Python |

### 阶段 4：深入源码/规范

| 模块 | 状态 | 完成日期 | 笔记 |
|------|------|----------|------|
| **RTPS 协议规范** | ✅ | 2026-01-23 | **全文学习完成！** 8056 行 |
| RTPS 结构模块 | ✅ | 2026-01-20 | Entity、HistoryCache、CacheChange、GUID |
| RTPS 消息模块 | ✅ | 2026-01-20 | 所有子消息类型详解 |
| RTPS 行为模块 | ✅ | 2026-01-23 | Stateless/Stateful Writer/Reader、状态机 |
| RTPS 发现模块 | ✅ | 2026-01-23 | SPDP、SEDP、内置端点配置 |
| DDS QoS 实现 | ✅ | 2026-01-23 | 内联 QoS、Content Filter、Coherent Sets |
| **PSM UDP/IP 映射** | ✅ | 2026-01-23 | 类型映射、子消息线路格式、端口计算 |
| **SerializedPayload 表示** | ✅ | 2026-01-23 | CDR/PL_CDR/CDR2、RepresentationIdentifier |
| **异步写入流程** | ✅ | 2026-02-03 | async_write 时序图、LatencyBudget、发送线程 |
| **DDS Security 插件** | ✅ | 2026-02-04 | 三大插件、DH 密钥交换、Handle 链、安全检查流程 |
| **MPT 测试框架** | ✅ | 2026-02-04 | Suite/Test/Process 三层结构、多进程测试 |
| **rbuf 接收缓冲区** | ✅ | 2026-02-04 | rmsg/chunk/rdata 结构、零拷贝、引用计数 |
| 核心数据结构 | 🔄 | - | rbuf/rdata 已学习，待深入其他结构 |
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

### 端口计算与 Discovery 配置（新增）
- [x] 理解端口计算公式：PB + DG × domainId + offset + PG × participantId
- [x] 理解默认参数：PB=7400, DG=250, PG=2, d0=0, d1=10, d2=1, d3=11
- [x] 理解 participantId 的作用域是同一 IP 地址（避免端口冲突）
- [x] 理解 SPDP 默认组播地址 239.255.0.1
- [x] 理解 SPDP 默认发送周期 30 秒
- [x] 理解 leaseDuration 默认值 100 秒

### 数据序列化与格式（新增）
- [x] 理解 Discovery 数据为什么用 ParameterList（版本兼容、厂商扩展、选择性包含）
- [x] 理解用户数据用 CDR（紧凑高效）vs Discovery 用 ParameterList（灵活可扩展）
- [x] 理解完整的 ParameterId 值表（QoS、Locator、Discovery 相关）
- [x] 理解 KeyHash 计算算法（≤16 字节直接用，>16 字节用 MD5）
- [x] 理解 StatusInfo_t 的 D/U/F 标志（Disposed/Unregistered/Filtered）
- [x] 理解 SerializedPayloadHeader（RepresentationIdentifier + Options）
- [x] 理解各种 RepresentationIdentifier（CDR_BE/LE, PL_CDR_BE/LE, CDR2 等）
- [x] 理解 Coherent Set 和 Group Coherent Set 的内联 QoS 表示
- [x] 通过 RepresentationIdentifier 前 2 字节区分 Discovery（PL_CDR）和用户数据（CDR）
- [x] 理解 CDR 字符串序列化：4 字节长度 + 内容 + '\0' + 4 字节对齐填充

### 项目构建与配置（新增）
- [x] 理解 DDS "共享数据空间" 设计哲学
- [x] 理解 WHC/RHC 分布式缓存实现共享数据空间
- [x] 理解 CMake `configure_package_config_file()` 函数
- [x] 理解 `@PACKAGE_INIT@` 占位符展开
- [x] 理解 `CMAKE_PREFIX_PATH` 与 `find_package()` 搜索机制
- [x] 理解 `CMAKE_CURRENT_LIST_DIR` 变量
- [x] 理解 `PackageConfig.cmake.in` 与 `CycloneDDSConfig.cmake` 的关系
- [x] 理解 `CYCLONEDDS_URI` 环境变量与运行时配置
- [x] 区分 `package.xml`（ROS 2 元数据）与 DDS 配置文件

### 异步写入流程（新增）
- [x] 理解 `dds_create_participant()` 内部调用链（domain_create_internal → rtps_init）
- [x] 理解 `dds_domain_create_internal` 中的 `internal` 命名约定
- [x] 理解 XML 配置的作用（Domain 全局参数 vs QoS 单个实体）
- [x] 理解 `dds_create_writer()` 与 `dds_write()` 的职责分离
- [x] 理解 LatencyBudget QoS 控制同步/异步写入模式
- [x] 理解异步模式下后台发送线程的工作流程
- [x] 理解 `nn_xpack_sendq_*` 系列函数的作用

### DDS Security 插件架构
- [x] 理解 DDS Security 三大插件：Authentication、AccessControl、Crypto
- [x] 理解 Authentication 插件：身份验证、握手流程、SharedSecretHandle
- [x] 理解 Token vs Handle 的区别（网络传输 vs 本地引用）
- [x] 理解 AccessControl 插件：权限验证、SecurityAttributes 层次
- [x] 理解 Crypto 插件三大接口：KeyFactory、KeyExchange、Transform
- [x] 理解加密层次：payload（数据）、submessage（子消息）、rtps_message（完整消息）
- [x] 理解 `encode_datawriter_submessage()` 是加密"由 Writer 发出的子消息"而非子消息类型
- [x] 理解 Diffie-Hellman 密钥交换产生 SharedSecretHandle
- [x] 理解安全检查链：Authentication → AccessControl → Crypto
- [x] 理解 Handle 传递：IdentityHandle → PermissionsHandle → Crypto 使用
- [x] 理解 Token 的网络传输用途（IdentityToken、PermissionsToken、CryptoToken）

### MPT 多进程测试框架（新增）
- [x] 理解 MPT 三层结构：Suite → Test → Process
- [x] 理解主运行器模式：遍历并启动子进程
- [x] 理解子进程模式：执行实际测试代码
- [x] 理解 CMake 生成的注册代码（蓝色部分）
- [x] 理解 MPT_TestProcess 和 MPT_ProcessEntry 宏

### rbuf 接收缓冲区数据结构（新增）
- [x] 理解 rbuf/rmsg/chunk/rdata 层级结构
- [x] 理解 rbuf 是预分配的大块内存池
- [x] 理解 rmsg 表示一个原始数据包 + 派生数据，含引用计数
- [x] 理解 chunk 是固定大小的分配单元，通过 chunk hdr 链接
- [x] 理解 lastchunk 指向当前 rmsg 的最后一个 chunk
- [x] 理解 rdata 的零拷贝设计：存储 offset + length 引用 rmsg 中的数据
- [x] 理解 rdata 引用 rmsg 用于生命周期管理（引用计数）
- [x] 理解只有 DATA/DATA_FRAG 子消息创建 rdata
- [x] 理解 defrag 用区间树管理分片重组
- [x] 理解 reorder 用区间树处理乱序样本
- [x] 理解 sampleinfo 存储样本元数据（时间戳、源地址等）
- [x] 理解 fragchain 链接分片的 rdata

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
2. ~~端口号计算公式的完整细节（PB、DG、d0、d1 参数）~~ ✅ 已学习
3. ~~DDS Security 扩展如何与 RTPS 集成~~ 🔄 已了解插件架构，待深入配置实践
4. 实际 Cyclone DDS 源码中的实现差异
5. 性能调优的具体参数和方法
6. DDS Security 配置文件的实际编写和使用

---

## 📝 学习笔记索引

| 日期 | 会话 | 主题 | 链接 |
|------|------|------|------|
| 2026-01-20 | session-01 | RTPS 消息模块与行为模块入门 | [session-01](../sessions/2026-01-20-session-01.md) |
| 2026-01-23 | session-02 | RTPS 行为模块深入、Discovery、高级特性 | [session-02](../sessions/2026-01-23-session-02.md) |
| 2026-01-23 | session-03 | PSM UDP/IP 映射、子消息线路格式 | [session-03](../sessions/2026-01-23-session-03.md) |
| 2026-01-23 | session-04 | 端口计算、ParameterId、SerializedPayload | [session-04](../sessions/2026-01-23-session-04.md) |
| 2026-01-23 | session-05 | 规范完结：序列化示例、CDR 字节对齐 | [session-05](../sessions/2026-01-23-session-05.md) |
| 2026-01-29 | session-06 | 项目结构、CMake 包配置、共享数据空间 | [session-06](../sessions/2026-01-29-session-06.md) |
| 2026-02-03 | session-07 | 异步写入流程、DDS Security 插件架构 | [session-07](../sessions/2026-02-03-session-07.md) |
| 2026-02-04 | session-08 | Security 插件深入、MPT 测试框架、rbuf 数据结构 | [session-08](../sessions/2026-02-04-session-08.md) |

---

## 状态说明

| 符号 | 含义 |
|------|------|
| ✅ | 已掌握 |
| 🔄 | 进行中 |
| ❓ | 待学习 |
| ⚠️ | 需复习 |
