---
name: cyclonedds-progress
description: 查看 CycloneDDS 学习进度 - 可视化显示各阶段完成情况和学习统计
---

# cyclonedds-progress - 查看进度

可视化显示 CycloneDDS 学习进度。

## 参数

```
/cyclonedds-progress
```

无参数。

## 执行步骤

### 1. 读取进度数据

使用 Read 工具读取 `.claude/memory/learning-progress.md`。

### 2. 计算进度

解析 markdown checklist：
- `[x]` = 100% (已完成)
- `[ ]` + 包含"进行中" = 50% (进行中)
- `[ ]` = 0% (未开始)

每个阶段包含 3 个主题：
- 阶段进度 = (已完成数 × 100 + 进行中数 × 50) / (主题总数 × 100) × 100%
- 总体进度 = 所有阶段进度的平均值

### 3. 生成进度条

使用 `█` 和 `░` 字符绘制，总长 10 格：
- 填充格数 = round(进度 / 10)
- 示例：80% → `████████░░`

### 4. 输出结果

```
📈 CycloneDDS 学习进度

阶段 1: 宏观架构理解 ████████░░ X%
  ✓ DDS 规范整体架构 (完成日期)
  ⚡ CycloneDDS 模块划分 (进行中)
  ○ 关键数据流

阶段 2: DCPS 层深入 ███░░░░░░░ X%
  ✓ Entity 模型实现 (完成日期)
  ○ QoS 策略机制
  ○ Discovery 机制

阶段 3: RTPS 协议层 ░░░░░░░░░░ X%
  ○ 消息格式与序列化
  ○ 可靠性保证
  ○ 网络传输层

阶段 4: 底层实现 ░░░░░░░░░░ X%
  ○ 内存管理
  ○ 并发控制
  ○ 性能优化

────────────────────────────────
总体进度: X%
开始日期: YYYY-MM-DD
学习天数: X 天

💡 使用 /cyclonedds-start 继续学习
   使用 /cyclonedds-next 获取下一步建议
```

## 关键文件

- `.claude/memory/learning-progress.md`: 学习进度数据源
