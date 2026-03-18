# 参考资料索引

## 源码文件

| 文件 | 路径 | 内容 |
|------|------|------|
| ddsi_radmin.c | [源码](../../source/cyclonedds/src/core/ddsi/src/ddsi_radmin.c) | rbuf 内存模型主实现（约 2900 行） |
| ddsi_radmin.h | [源码](../../source/cyclonedds/src/core/ddsi/include/dds/ddsi/ddsi_radmin.h) | 公开头文件：rmsg_chunk, rmsg, rdata 结构定义 |
| ddsi__radmin.h | [源码](../../source/cyclonedds/src/core/ddsi/src/ddsi__radmin.h) | 内部头文件：所有 API 声明、枚举定义 |
| ddsi_receive.c | [源码](../../source/cyclonedds/src/core/ddsi/src/ddsi_receive.c) | 接收路径：rbuf 的主要使用方 |
| ddsi_init.c | [源码](../../source/cyclonedds/src/core/ddsi/src/ddsi_init.c) | DDSI 初始化：rbufpool 创建 |
| ddsi_config.h | [源码](../../source/cyclonedds/src/core/ddsi/include/dds/ddsi/ddsi_config.h) | 配置参数定义 |
| defconfig.c | [源码](../../source/cyclonedds/src/core/ddsi/defconfig.c) | 默认配置值 |
| radmin.c | [源码](../../source/cyclonedds/src/core/ddsi/tests/radmin.c) | 单元测试 |

## 开发者文档

| 文件 | 路径 | 内容 |
|------|------|------|
| data path - rbuf.svg | [图片](<../../source/cyclonedds/docs/dev/data path - rbuf.svg>) | rbuf 数据路径官方示意图 |
| data path - receive.svg | [图片](<../../source/cyclonedds/docs/dev/data path - receive.svg>) | 接收路径官方示意图 |

## 章节索引

| 章节 | 文件 | 核心主题 |
|------|------|----------|
| 总览 | [00-overview.md](./00-overview.md) | 四层存储层次、典型场景、学习路线 |
| rbufpool/rbuf | [01-rbufpool-rbuf.md](./01-rbufpool-rbuf.md) | 内存池管理、顺序分配器、所有者模型 |
| rmsg/rdata | [02-rmsg-rdata.md](./02-rmsg-rdata.md) | 消息结构、偏置引用计数、动态 chunk |
| defrag | [03-defrag.md](./03-defrag.md) | 碎片重组、区间树、贪心合并 |
| reorder | [04-reorder.md](./04-reorder.md) | 消息重排序、三种模式、gap 处理 |
| dqueue | [05-dqueue.md](./05-dqueue.md) | 投递队列、bubble 机制、延迟唤醒 |

## 关键配置参数

| 参数 | 默认值 | 配置路径 |
|------|--------|----------|
| `rbuf_size` | 1,048,576 (1 MB) | `ddsi_config::rbuf_size` |
| `rmsg_chunk_size` | 131,072 (128 KB) | `ddsi_config::rmsg_chunk_size` |
