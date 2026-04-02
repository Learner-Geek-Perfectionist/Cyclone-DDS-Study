# Cyclone DDS Study

深入学习 [Eclipse Cyclone DDS](https://github.com/eclipse-cyclonedds/cyclonedds) 源码的个人学习仓库。

学习文档使用 [agent-study-skills](https://github.com/Learner-Geek-Perfectionist/agent-study-skills) 仓库中的核心 Skill `study-master` 生成。它面向 Claude Code、Codex 等 agent CLI，用于系统化拆解开源项目源码、协议规范和语言框架内部机制，并输出教科书风格的学习文档。

## 项目结构

```
.
├── source/cyclonedds/   # Cyclone DDS 源码（用于分析）
├── specs/               # DDS/RTPS 协议规范文档
└── study/               # 生成的学习文档
    └── rbuf-memory-model/   # 接收缓冲区内存模型
```

## 学习文档

### rbuf 内存模型

Cyclone DDS 接收路径的核心内存管理机制，实现高吞吐场景下的零拷贝与最小化动态分配。

| 章节 | 主题 |
|------|------|
| [00-overview](study/rbuf-memory-model/00-overview.md) | 总览：四层内存体系架构与数据流全景 |
| [01-rbufpool-rbuf](study/rbuf-memory-model/01-rbufpool-rbuf.md) | 接收缓冲池与大块连续内存分配器 |
| [02-rmsg-rdata](study/rbuf-memory-model/02-rmsg-rdata.md) | 消息描述符与引用计数生命周期管理 |
| [03-defrag](study/rbuf-memory-model/03-defrag.md) | 碎片重组器：基于区间树的分片重组 |
| [04-reorder](study/rbuf-memory-model/04-reorder.md) | 重排序器：乱序样本的按序投递 |
| [05-dqueue](study/rbuf-memory-model/05-dqueue.md) | 投递队列：异步批量投递到上层 |
| [appendix-references](study/rbuf-memory-model/appendix-references.md) | 参考资料索引 |

## 参考规范

- Data Distribution Service (DDS) v1.4
- DDS Interoperability Wire Protocol (RTPS) v2.5
- Extensible and Dynamic Topic Types for DDS v1.3
