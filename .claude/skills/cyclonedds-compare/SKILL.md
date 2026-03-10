---
name: cyclonedds-compare
description: 对比 OMG DDS/RTPS 规范定义与 CycloneDDS 源码实现的差异和关联
---

# cyclonedds-compare - 规范对照

对比 OMG DDS/RTPS 规范定义与 CycloneDDS 源码实现。

## 参数

```
/cyclonedds-compare <concept>
```

- `concept`：DDS 概念名称
- 示例：`/cyclonedds-compare QoS-Reliability`、`/cyclonedds-compare DomainParticipant`

## 执行步骤

### 1. 定位规范内容

使用 Grep 在 `dds-standards/` 中搜索概念：

规范文件映射：
- **DDS 核心概念**（Entity、QoS、Topic 等）→ `Data Distribution Service (DDS).txt`
- **RTPS 协议**（消息格式、Discovery、可靠性）→ `DDS-RTPS.txt`
- **数据类型**（IDL、序列化）→ `Extensible and Dynamic Topic Types for DDS, v1.txt`

提取：
1. 概念定义
2. 行为描述
3. 接口规范
4. 与其他概念的关系

### 2. 定位源码实现（使用 LSP）

使用 Read 工具读取相关源码：
1. 对应的结构体或类型定义
2. 实现函数
3. 相关的头文件声明

### 3. 对比分析

比较以下维度：
- **数据模型**：规范定义的属性 vs 源码实现的字段
- **行为**：规范要求的操作 vs 源码实现的函数
- **扩展**：CycloneDDS 超出规范的功能
- **差异**：实现与规范的偏差及原因

### 4. 生成 Markdown 文件

创建 `compares/YYYY-MM-DD-[概念名].md`，包含：

**文件结构**：
```markdown
# 规范-源码对照：[概念]

## 规范定义

### DDS/RTPS 规范
- **规范章节**：[章节号] [标题]
- **定义**：[规范原文摘要]
- **属性**：
  - 属性1: 描述
  - 属性2: 描述
- **操作**：
  - 操作1: 描述

## 源码实现

### 数据结构
**定义位置**：[struct name](file:///path#L50) （阅读 L50-L80）

```c
struct dds_xxx {
    type field1;  // 用途说明
    type field2;  // 用途说明
};
```

### 关键函数
- [func1](file:///path#L100) （阅读 L100-L120）：功能说明
- [func2](file:///path#L200) （阅读 L200-L250）：功能说明

## 对比分析

| 维度 | 规范要求 | CycloneDDS 实现 | 状态 |
|------|---------|----------------|------|
| 数据模型 | [要求] | [实现] | ✓ 完全实现 |
| 行为 | [要求] | [实现] | ✓ 实现 + 扩展 |
| ... | ... | ... | ... |

## CycloneDDS 扩展
- 扩展功能1：说明
- 扩展功能2：说明

## 设计决策分析
[解释 CycloneDDS 为何这样实现，与规范差异的原因]

## 下一步建议
1. 使用 /cyclonedds-trace [函数] 追踪实现细节
2. 对照 [相关概念] 理解完整机制
```

**超链接格式**：
- `[符号名](file:///绝对路径#L行号)` - 跳转到定义行
- 在链接后标注：`（阅读 L起始-L结束）`

### 5. 输出摘要

在聊天中输出：
```
📊 规范对照完成：[概念]

📄 已生成对照文档：
   compares/YYYY-MM-DD-[概念].md

✓ 规范章节：X 个
✓ 实现文件：X 个
✓ 扩展功能：X 个

💡 打开文档查看详细对比和源码超链接
```

## 关键文件

- `dds-standards/Data Distribution Service (DDS).txt`: DDS 核心规范
- `dds-standards/DDS-RTPS.txt`: RTPS 协议规范
- `dds-standards/Extensible and Dynamic Topic Types for DDS, v1.txt`: 数据类型规范
- `cyclonedds/src/`: 源码实现
- `.claude/memory/knowledge-map.md`: 知识图谱
- `compares/`: 对照文档输出目录
