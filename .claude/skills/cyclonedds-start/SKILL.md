---
name: cyclonedds-start
description: 开始 CycloneDDS 学习会话 - 显示当前进度、建议主题，或开始学习指定主题
---

# cyclonedds-start - 开始学习

开始一个 CycloneDDS 学习会话。

## 参数

```
/cyclonedds-start [topic]
```

- 无参数：显示当前学习阶段、进度和建议
- 带参数：开始学习指定主题（如 `DDS架构`、`QoS`、`Discovery`）

## 执行步骤

### 1. 读取学习状态

使用 Read 工具读取：
- `.claude/memory/learning-progress.md`：获取当前阶段和进度
- `.claude/memory/knowledge-map.md`：获取已掌握的知识点

### 2. 无参数时：显示概览

解析 learning-progress.md，输出：

```
📚 CycloneDDS 学习助手

当前阶段：阶段 X - [阶段名称] (进度: X%)
已完成：[已完成主题列表]
进行中：[进行中主题]

建议下一步：
1. [建议 1 - 基于当前进度推荐]
2. [建议 2]
3. [建议 3]

💡 使用 /cyclonedds-start <主题> 开始学习
   使用 /cyclonedds-progress 查看详细进度
   使用 /cyclonedds-next 获取个性化建议
```

### 3. 带参数时：开始主题学习

根据主题定位相关资源：

1. **定位规范章节**：使用 Grep 在 `dds-standards/` 中搜索主题关键词
2. **定位源码文件**：使用 Grep 在 `cyclonedds/src/` 中搜索相关实现
3. **提供学习引导**：

```
📚 开始学习：[主题名称]

📖 相关规范：
- [规范文件]: [章节标题]

💻 相关源码：
- [源码路径]: [文件说明]

🎯 学习目标：
1. [目标 1]
2. [目标 2]
3. [目标 3]

❓ 引导问题：
1. [引导问题 - 帮助建立整体认知]

让我们从第一个问题开始。你对 [主题] 有什么初步了解？
```

4. **更新进度**：将该主题标记为"进行中"

## 学习路径参考

### 阶段 1：宏观架构理解
- DDS 规范整体架构
- CycloneDDS 模块划分
- 关键数据流

### 阶段 2：DCPS 层深入
- Entity 模型实现
- QoS 策略机制
- Discovery 机制

### 阶段 3：RTPS 协议层
- 消息格式与序列化
- 可靠性保证
- 网络传输层

### 阶段 4：底层实现
- 内存管理
- 并发控制
- 性能优化

## 关键文件

- `.claude/memory/learning-progress.md`: 学习进度
- `.claude/memory/knowledge-map.md`: 知识图谱
- `cyclonedds/`: 源码目录
- `dds-standards/`: 规范文档目录
