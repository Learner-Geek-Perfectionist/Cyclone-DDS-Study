# CycloneDDS 学习进度

## 总览

- **开始日期**: 2026-03-11
- **当前阶段**: 阶段 3 — RTPS 协议引擎 (rbuf 内存模型进行中)
- **总主题数**: 27
- **已完成**: 0

## 阶段 1 — 架构总览与运行时基础 (ddsrt)

- [ ] 整体架构与模块依赖关系
- [ ] ddsrt 线程与同步原语 (threads, sync, atomics)
- [ ] ddsrt 网络抽象 (sockets, ifaddrs)
- [ ] ddsrt 内存与数据结构 (hopscotch, avl, fibheap, circlist)
- [ ] ddsrt 日志与配置系统

## 阶段 2 — DDS 核心 API 层 (ddsc)

- [ ] 实体层次结构与句柄管理 (entity, handles, domain)
- [ ] DomainParticipant 创建与初始化 (dds_init, participant)
- [ ] Topic 与类型系统 (topic, sertype, serdata)
- [ ] Publisher/Subscriber 与 QoS (publisher, subscriber, qos)
- [ ] DataWriter 写路径 (writer, write, whc)
- [ ] DataReader 读路径与缓存 (reader, read, rhc, rhc_default)

## 阶段 3 — RTPS 协议引擎 (ddsi)

- [ ] RTPS 实体与端点管理 (participant, endpoint, proxy_*)
- [ ] SPDP/SEDP 发现协议 (discovery_spdp, discovery_endpoint)
- [ ] 消息格式与序列化 (protocol, xmsg, plist)
- [ ] 传输层抽象 (tran, udp, tcp)
- [x] 接收路径与消息分发 (receive, radmin, deliver_locally) — rbuf 内存模型
- [ ] 可靠性引擎：ACK/NACK 与心跳 (acknack, hbcontrol, xevent)

## 阶段 4 — 数据通路端到端

- [ ] 写入路径：dds_write → 序列化 → WHC → 发送
- [ ] 接收路径：网络接收 → radmin → 反序列化 → RHC
- [ ] 本地快捷路径 (deliver_locally)
- [ ] Writer History Cache (WHC) 内存模型
- [ ] Reader History Cache (RHC) 实例状态机

## 阶段 5 — 序列化与类型系统 (CDR/XTypes)

- [ ] CDR 编码/解码引擎 (dds_cdrstream)
- [ ] serdata/sertype 抽象与内置实现
- [ ] IDL 编译器架构 (parser → processor → codegen)
- [ ] 动态类型支持 (dynamic_type)

## 阶段 6 — 安全与高级特性

- [ ] Security 插件架构与 SPI 接口
- [ ] 认证与握手流程 (authentication, handshake)
- [ ] 加密传输 (cryptography)
- [ ] PSMX 共享内存接口 (psmx, psmx_iox)

## 学习记录

| 日期 | 主题 | 类型 | 耗时 | 笔记链接 |
|------|------|------|------|----------|
| 2026-03-11 | rbuf 内存模型 | 学习计划 | — | [study/plans/rbuf-内存模型/](../../study/plans/rbuf-内存模型/) |
