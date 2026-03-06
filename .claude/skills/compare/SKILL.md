---
name: compare
description: 对照 OMG 规范定义与 Cyclone DDS 源码实现的异同
disable-model-invocation: false
argument-hint: <主题>
---

# 规范-源码对照

用户提供一个主题（如 Discovery、QoS 匹配、DataFrag 处理），按以下步骤执行：

## 流程

1. **定位规范章节**：
   - DDS 规范: `dds-standards/Data Distribution Service (DDS).txt`
   - RTPS 规范: `dds-standards/DDS-RTPS.txt`
   - XTypes 规范: `dds-standards/Extensible and Dynamic Topic Types for DDS, v1.txt`
   - 找到与主题相关的章节，阅读关键段落

2. **定位源码文件**：
   - 根据 `.claude/rules/source-code.md` 中的规范-源码映射，找到对应实现文件
   - 阅读关键数据结构和函数

3. **展示规范模型**：
   - 先讲规范定义的抽象模型、概念、流程
   - 引用规范原文（附章节号）

4. **展示源码实现**：
   - 对应的 C 结构体、函数
   - 实现中的关键设计决策
   - 附 `文件名:行号`

5. **对比分析**：
   - 实现忠实于规范的部分
   - 实现与规范的差异（简化、扩展、优化）
   - Cyclone DDS 特有的实现细节

## 输出格式

使用简体中文。规范引用标注章节号，源码引用标注文件名:行号。
先规范后源码，最后对比总结。
