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

### 2. 定位源码实现

使用 Grep 在 `cyclonedds/` 中搜索：
1. 对应的结构体或类型定义
2. 实现函数
3. 相关的头文件声明

### 3. 对比分析

比较以下维度：
- **数据模型**：规范定义的属性 vs 源码实现的字段
- **行为**：规范要求的操作 vs 源码实现的函数
- **扩展**：CycloneDDS 超出规范的功能
- **差异**：实现与规范的偏差及原因

### 4. 输出结果

```
📊 规范-源码对照：[概念]

┌─────────────────────────────────┬─────────────────────────────────┐
│ DDS/RTPS 规范                    │ CycloneDDS 实现                  │
├─────────────────────────────────┼─────────���───────────────────────┤
│                                 │                                 │
│ 定义：                          │ 实现：                          │
│ [规范原文摘要]                  │ [源码关键代码片段]              │
│                                 │                                 │
│ 属性：                          │ 字段：                          │
│ - [属性1]: [描述]               │ - [字段1]: [类型] // [用途]     │
│ - [属性2]: [描述]               │ - [字段2]: [类型] // [用途]     │
│                                 │                                 │
│ 操作：                          │ 函数：                          │
│ - [操作1]: [描述]               │ - [函数1](): [说明]             │
│                                 │                                 │
├─────────────────────────────────┼─────────────────────────────────┤
│ 规范要求                        │ 实现状况                        │
├─────────────────────────────────┼─────────────────────────────────┤
│ [要求1]                         │ ✓ 完全实现                      │
│ [要求2]                         │ ✓ 实现 + 扩展                   │
│ [要求3]                         │ ✗ 未实现 / 部分实现             │
│                                 │ + [CycloneDDS 扩展功能]         │
└─────────────────────────────────┴─────────────────────────────────┘

📁 关键实现文件：
- [文件路径1]: [说明]
- [文件路径2]: [说明]

🔍 设计决策分析：
[解释 CycloneDDS 为何这样实现，与规范差异的原因]

💡 建议深入：
1. 使用 /cyclonedds-trace [函数] 追踪实现细节
2. 对照 [相关概念] 理解完整机制
```

## 关键文件

- `dds-standards/Data Distribution Service (DDS).txt`: DDS 核心规范
- `dds-standards/DDS-RTPS.txt`: RTPS 协议规范
- `dds-standards/Extensible and Dynamic Topic Types for DDS, v1.txt`: 数据类型规范
- `cyclonedds/src/`: 源码实现
- `.claude/memory/knowledge-map.md`: 知识图谱
