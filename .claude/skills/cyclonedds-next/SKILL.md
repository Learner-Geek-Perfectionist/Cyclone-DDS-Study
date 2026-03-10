---
name: cyclonedds-next
description: 基于当前学习进度智能推荐下一个 CycloneDDS 学习主题和资源
---

# cyclonedds-next - 获取建议

基于当前学习进度推荐下一步学习内容。

## 参数

```
/cyclonedds-next
```

无参数。

## 执行步骤

### 1. 读取学习状态

使用 Read 工具读取：
- `.claude/memory/learning-progress.md`：当前进度
- `.claude/memory/knowledge-map.md`：已掌握知识

### 2. 分析状态

确定：
- 当前阶段和完成度
- 进行中的主题
- 最近学习的日期（判断是否需要复习）
- 下一个未开始的主题

### 3. 生成建议

提供 3 个选项，每个包含具体资源：

```
💡 CycloneDDS 学习建议

基于你的当前进度（阶段 X: X%），建议：

────────────────────────────────

选项 1：[继续/完成当前主题] (推荐)
  📝 主题：[主题名称]
  ⏱  预计时间：X-X 小时
  📖 规范资源：
    - [规范文件] [章节号]: [标题]
  💻 源码资源：
    - [源码路径]: [说明]
  🎯 学习目标：
    - [目标]

────────────────────────────────

选项 2：[下一个新主题]
  📝 主题：[主题名称]
  ⏱  预计时间：X-X 小时
  📖 规范资源：
    - [规范文件] [章节号]: [标题]
  💻 源码资源：
    - [源码路径]: [说明]
  🎯 学习目标：
    - [目标]

────────────────────────────────

选项 3：复习巩固
  📝 建议复习：[主题名称]
  📋 原因：[距离上次学习已 X 天 / 相关概念即将用到]
  🔄 复习方式：
    - 使用 /cyclonedds-trace [函数] 重新追踪
    - 使用 /cyclonedds-compare [概念] 重新对照

────────────────────────────────

使用 /cyclonedds-start <主题> 开始学习
```

### 4. 主题-资源映射表

| 主题 | 规范章节 | 关键源码 |
|------|---------|---------|
| DDS 规范整体架构 | DDS 2.1, 2.2 | cyclonedds/ 目录结构 |
| CycloneDDS 模块划分 | - | src/core/ 各子目录 |
| 关键数据流 | DDS 2.2.2, RTPS 8.3 | ddsc/src/, ddsi/src/ |
| Entity 模型 | DDS 2.2.1, 2.2.2 | dds_participant.c, dds_writer.c |
| QoS 策略 | DDS 2.2.3 | dds_qos.c |
| Discovery | DDS 2.2.5, RTPS 8.5 | ddsi_discovery.c |
| 消息格式 | RTPS 8.3, 9.4 | ddsi_xmsg.c |
| 可靠性 | RTPS 8.4 | ddsi_transmit.c |
| 网络传输 | RTPS 9 | ddsi_udp.c, ddsi_tcp.c |
| 内存管理 | - | ddsrt/src/heap*.c |
| 并发控制 | - | ddsrt/src/sync*.c |
| 性能优化 | - | ddsi_transmit.c, ddsi_receive.c |

## 关键文件

- `.claude/memory/learning-progress.md`: 学习进度
- `.claude/memory/knowledge-map.md`: 知识图谱
