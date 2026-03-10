---
name: cyclonedds-trace
description: 追踪 CycloneDDS 源码中的函数调用链、数据结构和代码执行路径
---

# cyclonedds-trace - 代码追踪

追踪 CycloneDDS 源码中的函数调用链和数据结构。

## 参数

```
/cyclonedds-trace <target>
```

- `target`：函数名、结构体名或源码文件路径
- 示例：`/cyclonedds-trace dds_write`、`/cyclonedds-trace ddsi_writer`

## 执行步骤

### 1. 定位目标

使用 Grep 在 `cyclonedds/` 中搜索目标：

**如果是函数名**：
- 搜索函数定义（`^.*target.*\(`）
- 搜索函数声明（头文件中）
- 确定所在文件和行号

**如果是结构体名**：
- 搜索 `struct target` 定义
- 搜索使用该结构体的函数

**如果是文件路径**：
- 直接读取文件内容
- 分析文件中的关键函数和数据结构

### 2. 追踪调用链

从目标函数出发：
1. 读取函数实现
2. 识别内部调用的关键函数
3. 递归追踪（深度 3-5 层）
4. 构建调用链图

### 3. 识别关键数据结构

在调用链中：
1. 提取所有使用的结构体类型
2. 定位结构体定义
3. 解释关键字段含义

### 4. 关联规范章节

使用 Grep 在 `dds-standards/` 中搜索：
1. 函数对应的规范操作
2. 数据结构对应的规范模型
3. 协议行为对应的规范描述

### 5. 输出结果

```
🔍 追踪：[目标]

📍 定义位置：
[文件路径:行号]

📞 调用链：
[函数1] (文件路径:行号)
  ↓ [调用原因/说明]
[函数2] (文件路径:行号)
  ↓
[函数3] (文件路径:行号)
  ↓
...

📦 关键数据结构：
- [结构体名] (定义: 文��路径:行号)
  - [字段1]: [类型] - [用途说明]
  - [字段2]: [类型] - [用途说明]

📖 规范对应：
- DDS 规范 [章节号]: [标题]
- RTPS 规范 [章节号]: [标题]

💡 下一步建议：
1. 深入 [函数名] 了解 [具体机制]
2. 使用 /cyclonedds-compare [概念] 对照规范
3. 追踪 [相关函数] 理解 [相关机制]
```

### 6. 更新知识图谱

将追踪结果添加到 `.claude/memory/knowledge-map.md` 的"已追踪"部分。

## 关键文件

- `cyclonedds/src/core/ddsc/src/`: DCPS 层实现
- `cyclonedds/src/core/ddsi/src/`: DDSI/RTPS 层实现
- `cyclonedds/src/core/ddsc/include/`: 公共 API 头文件
- `dds-standards/`: 规范文档
- `.claude/memory/knowledge-map.md`: 知识图谱
