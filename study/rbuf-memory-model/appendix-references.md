# 附录：参考资料索引

## 源码文件

| 文件 | 路径 | 说明 |
|:--|:--|:--|
| ddsi_radmin.c | [ddsi_radmin.c](../../src/cyclonedds/src/core/ddsi/src/ddsi_radmin.c) | rbuf 内存模型主实现（约 2900 行） |
| ddsi_radmin.h | [ddsi_radmin.h](../../src/cyclonedds/src/core/ddsi/include/dds/ddsi/ddsi_radmin.h) | 公共数据结构定义 |
| ddsi__radmin.h | [ddsi__radmin.h](../../src/cyclonedds/src/core/ddsi/src/ddsi__radmin.h) | 内部 API 声明 |
| ddsi_receive.c | [ddsi_receive.c](../../src/cyclonedds/src/core/ddsi/src/ddsi_receive.c) | 接收路径（rbuf 的主要消费者） |
| ddsi_domaingv.h | [ddsi_domaingv.h](../../src/cyclonedds/src/core/ddsi/include/dds/ddsi/ddsi_domaingv.h) | 域全局变量（rbufpool 持有者） |
| ddsi_config.h | [ddsi_config.h](../../src/cyclonedds/src/core/ddsi/include/dds/ddsi/ddsi_config.h) | 配置参数（rbuf_size 等） |
| radmin.c | [radmin.c](../../src/cyclonedds/src/core/ddsi/tests/radmin.c) | radmin 单元测试 |

## 设计文档

| 文档 | 路径 | 说明 |
|:--|:--|:--|
| data path - rbuf.svg | [data path - rbuf.svg](../../src/cyclonedds/docs/dev/data%20path%20-%20rbuf.svg) | 官方 rbuf 数据路径图 |
| data path - receive.svg | [data path - receive.svg](../../src/cyclonedds/docs/dev/data%20path%20-%20receive.svg) | 官方接收路径图 |

## 学习章节导航

| 章节 | 文件 | 内容 |
|:--|:--|:--|
| 快速导览 | [00-overview.md](./00-overview.md) | 四层存储体系、三级处理管线、典型收包流程 |
| 第 1 章 | [01-rbufpool-rbuf.md](./01-rbufpool-rbuf.md) | 缓冲池与接收缓冲区：池化管理、顺序分配、线程所有权 |
| 第 2 章 | [02-rmsg-rdata.md](./02-rmsg-rdata.md) | 消息管理与引用计数：双偏置 refcount、chunk 链式扩展 |
| 第 3 章 | [03-defrag.md](./03-defrag.md) | 分片重组：AVL 区间树、合并算法、rsample union 双态 |
| 第 4 章 | [04-reorder.md](./04-reorder.md) | 序列重排：三种模式、gap 处理、refcount 调整协议 |
| 第 5 章 | [05-dqueue.md](./05-dqueue.md) | 投递队列：bubble 机制、背压控制、deaf 模式 |
