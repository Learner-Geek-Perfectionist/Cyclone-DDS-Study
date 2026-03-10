# CycloneDDS 知识图谱

## 核心概念关系

DDS Architecture
├── DCPS Layer
│   ├── DomainParticipant → 待学习 ○
│   ├── Publisher/Subscriber → 待学习 ○
│   ├── DataWriter/DataReader → 待学习 ○
│   ├── Topic → 待学习 ○
│   └── QoS Policies
│       ├── Reliability → 待学习 ○
│       ├── Durability → 待学习 ○
│       └── History → 待学习 ○
└── RTPS Layer
    ├── RTPS Messages → 待学习 ○
    ├── Discovery Protocol → 待学习 ○
    └── Reliability Protocol → 待学习 ○

## 源码映射

### DCPS → 源码
- DomainParticipant → src/core/ddsc/src/dds_participant.c
- DataWriter → src/core/ddsc/src/dds_writer.c
- DataReader → src/core/ddsc/src/dds_reader.c
- QoS → src/core/ddsc/src/dds_qos.c

### RTPS → 源码
- Discovery → src/core/ddsi/src/ddsi_discovery.c
- Transmit → src/core/ddsi/src/ddsi_transmit.c
- Receive → src/core/ddsi/src/ddsi_receive.c

## 关键函数追踪

### 已追踪
暂无

### 待追踪
- dds_create_participant
- dds_create_writer
- dds_write
- ddsi_write_sample
