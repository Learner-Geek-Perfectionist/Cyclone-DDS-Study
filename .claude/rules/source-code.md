# 源码目录与规范映射

## 源码三层架构

```
ddsc (C API, DDS 规范 Ch2) --> ddsi (RTPS 协议, Ch8-9) --> cdr (序列化, XTypes Ch7.4)
```

## 完整源码目录树

```
cyclonedds/src/
├── core/                              # DDS 核心实现
│   ├── cdr/src/
│   │   └── dds_cdrstream.c                    # CDR 流式序列化 (XTypes Ch7.4)
│   │
│   ├── ddsc/                          # DDS C API 层 (DDS 规范 Ch2)
│   │   ├── include/dds/
│   │   │   ├── dds.h                          # 主 API 头文件（入口）
│   │   │   └── ddsc/
│   │   │       ├── dds_public_qos.h           # QoS 公共 API
│   │   │       ├── dds_public_status.h        # Status 公共 API
│   │   │       ├── dds_psmx.h                 # PSMX 接口
│   │   │       └── dds_rhc.h                  # Reader History Cache 接口
│   │   └── src/
│   │       ├── dds_entity.c                   # Entity 基类 (Ch2.2.2.1 Infrastructure)
│   │       ├── dds_domain.c                   # Domain 管理 (Ch2.2.2.2)
│   │       ├── dds_participant.c              # DomainParticipant (Ch2.2.2.2)
│   │       ├── dds_topic.c                    # Topic (Ch2.2.2.3)
│   │       ├── dds_publisher.c                # Publisher (Ch2.2.2.4)
│   │       ├── dds_writer.c                   # DataWriter (Ch2.2.2.4)
│   │       ├── dds_subscriber.c               # Subscriber (Ch2.2.2.5)
│   │       ├── dds_reader.c                   # DataReader (Ch2.2.2.5)
│   │       ├── dds_qos.c                      # QoS 管理 (Ch2.2.3)
│   │       ├── dds_listener.c                 # Listener 回调 (Ch2.2.4)
│   │       ├── dds_waitset.c                  # WaitSet 同步 (Ch2.2.4)
│   │       ├── dds_builtin.c                  # 内置主题 (Ch2.2.5)
│   │       ├── dds_dynamic_type.c             # 动态类型 (XTypes Ch7.5.2)
│   │       ├── dds_alloc.c                    # 内存分配
│   │       └── dds_sertype.c                  # 序列化类型支持
│   │
│   ├── ddsi/                          # RTPS 协议层 (RTPS 规范 Ch8-9)
│   │   ├── include/dds/ddsi/
│   │   │   ├── ddsi_protocol.h                # RTPS 协议定义
│   │   │   ├── ddsi_entity.h                  # RTPS 实体接口
│   │   │   ├── ddsi_endpoint.h                # Endpoint 接口
│   │   │   ├── ddsi_participant.h             # Participant 接口
│   │   │   ├── ddsi_discovery.h               # Discovery 接口
│   │   │   ├── ddsi_serdata.h                 # 序列化数据接口
│   │   │   ├── ddsi_sertype.h                 # 序列化类型接口
│   │   │   ├── ddsi_whc.h                     # Writer History Cache
│   │   │   ├── ddsi_rhc.h                     # Reader History Cache
│   │   │   ├── ddsi_tran.h                    # 传输层接口
│   │   │   ├── ddsi_radmin.h                  # 接收管理
│   │   │   └── ddsi_xmsg.h                    # 消息构建
│   │   └── src/
│   │       ├── ddsi_discovery.c               # Discovery 主逻辑 (Ch8.5)
│   │       ├── ddsi_discovery_spdp.c          # SPDP 实现
│   │       ├── ddsi_discovery_endpoint.c      # SEDP / Endpoint Discovery
│   │       ├── ddsi_transmit.c                # 发送逻辑 (Ch8.4 Behavior)
│   │       ├── ddsi_receive.c                 # 接收逻辑 (Ch8.4 Behavior)
│   │       ├── ddsi_xmsg.c                    # RTPS 消息构建 (Ch8.3 Messages)
│   │       ├── ddsi_plist.c                   # Parameter List 处理
│   │       ├── ddsi_udp.c                     # UDP 传输 (Ch9 PSM)
│   │       ├── ddsi_tcp.c                     # TCP 传输
│   │       ├── ddsi_whc.c                     # Writer History Cache
│   │       ├── ddsi_endpoint_match.c          # Endpoint 匹配
│   │       ├── ddsi_qosmatch.c                # QoS 匹配
│   │       ├── ddsi_serdata_cdr.c             # CDR 序列化数据
│   │       ├── ddsi_dynamic_type.c            # XTypes 动态类型
│   │       ├── ddsi_typelookup.c              # XTypes Type Lookup 服务
│   │       ├── ddsi_xt_typeinfo.c             # XTypes TypeInformation
│   │       ├── ddsi_xt_typemap.c              # XTypes TypeMapping
│   │       └── ddsi_radmin.c                  # 接收缓冲区管理
│   │
│   └── xtests/                        # 扩展测试
│       ├── rhc_torture/                       # RHC 压力测试
│       └── cdrtest/                           # CDR 测试
│
├── ddsrt/                             # DDS 运行时库（平台抽象层）
│   └── [线程、时间、网络、内存、同步原语等]
│
├── idl/                               # IDL 类型系统支持库
│
├── tools/                             # 工具程序
│   ├── idlc/                                  # IDL 编译器
│   ├── ddsperf/                               # 性能测试工具
│   └── _confgen/                              # 配置生成器
│
├── security/                          # 安全插件
│   ├── api/                                   # 安全 API 定义
│   ├── core/                                  # 安全核心（状态机、插件管理）
│   ├── builtin_plugins/                       # 内置插件（认证、访问控制、加密）
│   └── openssl/                               # OpenSSL 支持
│
└── psmx_iox/                          # Iceoryx PSMX 共享内存插件
```

## 规范章节 -> 源码映射

### DDS 规范 (dds-standards/Data Distribution Service (DDS).txt v1.4)

| 章节 | 内容 | 对应源码 |
|------|------|----------|
| Ch2.2.2.1 | Infrastructure Module -- Entity, QosPolicy, Listener, WaitSet | `ddsc/src/dds_entity.c`, `dds_qos.c`, `dds_listener.c`, `dds_waitset.c` |
| Ch2.2.2.2 | Domain Module -- DomainParticipant, Factory | `ddsc/src/dds_domain.c`, `dds_participant.c` |
| Ch2.2.2.3 | Topic-Definition Module -- Topic, TypeSupport | `ddsc/src/dds_topic.c`, `dds_sertype.c` |
| Ch2.2.2.4 | Publication Module -- Publisher, DataWriter | `ddsc/src/dds_publisher.c`, `dds_writer.c` |
| Ch2.2.2.5 | Subscription Module -- Subscriber, DataReader | `ddsc/src/dds_subscriber.c`, `dds_reader.c` |
| Ch2.2.3 | Supported QoS -- 22 种 QoS 策略 | `ddsc/src/dds_qos.c`, `ddsi/src/ddsi_qosmatch.c` |
| Ch2.2.5 | Built-in Topics | `ddsc/src/dds_builtin.c` |

### RTPS 规范 (dds-standards/DDS-RTPS.txt v2.5)

| 章节 | 内容 | 对应源码 |
|------|------|----------|
| Ch8.2 | Structure Module -- RTPS 实体结构 | `ddsi/src/ddsi_entity.c`, `ddsi_participant.c` |
| Ch8.3 | Messages Module -- RTPS 消息格式 | `ddsi/src/ddsi_xmsg.c`, `ddsi_plist.c` |
| Ch8.4 | Behavior Module -- 状态机、可靠传输 | `ddsi/src/ddsi_transmit.c`, `ddsi_receive.c` |
| Ch8.5 | Discovery Module -- SPDP, SEDP | `ddsi/src/ddsi_discovery_spdp.c`, `ddsi_discovery_endpoint.c` |
| Ch9 | PSM: UDP/IP -- 消息映射 | `ddsi/src/ddsi_udp.c`, `ddsi_tcp.c` |
| Ch10 | Serialized Payload | `ddsi/src/ddsi_serdata_cdr.c` |

### XTypes 规范 (dds-standards/Extensible and Dynamic Topic Types for DDS, v1.txt v1.3)

| 章节 | 内容 | 对应源码 |
|------|------|----------|
| Ch7.2 | Type System -- 类型系统模型 | `ddsi/src/ddsi_xt_typemap.c`, `ddsi_xt_typeinfo.c` |
| Ch7.2.4 | Type Compatibility -- Assignability | `ddsi/src/ddsi_typecompat.c` |
| Ch7.3 | Type Representation -- TypeObject | `ddsi/src/ddsi_typewrap.c` |
| Ch7.4 | Data Representation -- XCDR | `core/cdr/src/dds_cdrstream.c` |
| Ch7.5 | Language Binding | `ddsc/src/dds_dynamic_type.c` |
| Ch7.6 | Type Lookup Service | `ddsi/src/ddsi_typelookup.c` |

## 源码阅读入口

- **API 入口**: `cyclonedds/src/core/ddsc/include/dds/dds.h`
- **写入链路**: `dds_write()` -> `ddsi_transmit()` -> `ddsi_xmsg` -> `ddsi_udp`
- **接收链路**: socket -> `ddsi_receive.c` -> rmsg -> defrag -> reorder -> dqueue
- **发现链路**: `ddsi_discovery_spdp.c` (SPDP) + `ddsi_discovery_endpoint.c` (SEDP)
