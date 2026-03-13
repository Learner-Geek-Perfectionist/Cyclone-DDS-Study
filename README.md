# Cyclone DDS Study

[Eclipse Cyclone DDS](https://github.com/eclipse-cyclonedds/cyclonedds) 源码深度学习项目。

使用 [Study-Master Skill](https://github.com/Learner-Geek-Perfectionist/claude-code-study-skills) 配合 Claude Code 自动生成教科书风格的源码分析文档，覆盖架构设计、数据结构、核心算法和关键代码路径。

## 项目结构

```
.
├── src/cyclonedds/          # Cyclone DDS 源码（用于阅读和分析）
├── study/                   # 生成的学习文档
│   └── rbuf-memory-model/   # 接收缓冲区内存模型（radmin 子系统）
├── docs/                    # DDS/RTPS/XTypes 协议规范文本（.gitignore）
└── pixi.toml                # 构建环境配置（pixi 包管理）
```

## 已完成的学习主题

### 1. rbuf 接收缓冲区内存模型

> 路径：[`study/rbuf-memory-model/`](study/rbuf-memory-model/)

深入分析 Cyclone DDS 接收路径的核心子系统 `radmin`——从 UDP 收包到数据投递的完整数据流，涵盖零拷贝设计、引用计数、分片重组、序列重排等机制。

| 章节 | 文件 | 内容 |
|:--|:--|:--|
| 快速导览 | [`00-overview.md`](study/rbuf-memory-model/00-overview.md) | 四层存储体系、三级处理管线、核心设计理念 |
| 缓冲池与接收缓冲区 | [`01-rbufpool-rbuf.md`](study/rbuf-memory-model/01-rbufpool-rbuf.md) | `ddsi_rbufpool` / `ddsi_rbuf` 的分配策略与生命周期 |
| 消息管理与引用计数 | [`02-rmsg-rdata.md`](study/rbuf-memory-model/02-rmsg-rdata.md) | `ddsi_rmsg` 双偏置引用计数、`ddsi_rdata` 与零拷贝 |
| 分片重组机制 | [`03-defrag.md`](study/rbuf-memory-model/03-defrag.md) | `ddsi_defrag` AVL 树区间合并算法 |
| 序列重排机制 | [`04-reorder.md`](study/rbuf-memory-model/04-reorder.md) | `ddsi_reorder` 序列号区间树与 GAP 处理 |
| 投递队列 | [`05-dqueue.md`](study/rbuf-memory-model/05-dqueue.md) | `ddsi_dqueue` 生产者-消费者模型与异步投递 |
| 参考资料索引 | [`appendix-references.md`](study/rbuf-memory-model/appendix-references.md) | 源码文件索引与协议规范引用 |

## 环境搭建

项目使用 [pixi](https://pixi.sh) 管理构建依赖（CMake、编译器、OpenSSL 等）：

```bash
# 安装 pixi（如果尚未安装）
curl -fsSL https://pixi.sh/install.sh | bash

# 克隆项目
git clone https://github.com/Learner-Geek-Perfectionist/Cyclone-DDS-Study.git
cd Cyclone-DDS-Study

# 激活环境
pixi shell
```

## 文档生成工具

学习文档由 [Study-Master Skill](https://github.com/Learner-Geek-Perfectionist/claude-code-study-skills) 生成，特性包括：

- LSP 驱动的精确符号定位与调用链分析
- 多 Agent 并行生成，加速大型模块分析
- 教科书风格的渐进式讲解：架构概览 → 数据结构 → 伪代码 → 源码实现
- 自动格式校验与一致性检查

## License

学习文档部分为个人学习笔记。Cyclone DDS 源码遵循 [Eclipse Public License 2.0](https://www.eclipse.org/legal/epl-2.0/)。
