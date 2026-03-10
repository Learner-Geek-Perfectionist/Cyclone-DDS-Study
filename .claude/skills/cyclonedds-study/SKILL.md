---
name: cyclonedds-study
description: CycloneDDS 源码学习助手 - 提供引导式学习路径、代码追踪、规范对照和进度管理
---

# CycloneDDS Study Skill

深入学习 CycloneDDS 源码实现的综合学习工具。

## 使用方法

```bash
/cyclonedds-study start [topic]    # 开始学习
/cyclonedds-study progress          # 查看进度
/cyclonedds-study trace <target>    # 追踪代码
/cyclonedds-study compare <concept> # 规范对照
/cyclonedds-study session           # 结束会话
/cyclonedds-study next              # 获取建议
```

## 命令实现

### 解析用户输入

从用户输入中提取子命令和参数，然后路由到对应的处理逻辑。

---

## start - 开始学习

读取 `.claude/memory/learning-progress.md` 获取当前进度。

如果用户未指定主题：
1. 显示当前阶段和进度
2. 列出已完成和进行中的主题
3. 提供 3 个学习建议

如果用户指定主题：
1. 根据主题定位相关资源（规范章节、源码文件）
2. 提供学习引导问题
3. 开始交互式学习

输出格式：
```
📚 CycloneDDS 学习助手

当前阶段：阶段 X - [阶段名称] (进度: X%)
已完成：[已完成主题列表]
进行中：[进行中主题]

建议下一步：
1. [建议 1]
2. [建议 2]
3. [建议 3]
```

---

## progress - 查看进度

读取 `.claude/memory/learning-progress.md`，解析并可视化显示。

计算逻辑：
- 每个阶段包含 3 个主题
- 每个主题完成度：0% (未开始), 50% (进行中), 100% (已完成)
- 阶段进度 = 该阶段所有主题完成度的平均值
- 总体进度 = 所有阶段进度的平均值

输出格式：
```
📈 学习进度

阶段 1: [名称] ████████░░ X%
  ✓ [已完成主题]
  ⚡ [进行中主题]
  ○ [未开始主题]

阶段 2: [名称] ███░░░░░░░ X%
  ...

总体进度: X%
学习天数: X 天
会话数: X 次

建议下一步：[建议]
```

---

## trace - 代码追踪

追踪函数调用链和数据结构。

步骤：
1. 使用 Grep 在 `cyclonedds/` 中搜索目标函数定义
2. 使用 Read 读取相关源码文件
3. 分析函数调用关系
4. 识别关键数据结构
5. 关联规范章节（从 `dds-standards/` 搜索相关内容）

输出格式：
```
🔍 追踪：[目标]

调用链：
[函数1] (文件路径:行号)
  ↓
[函数2]
  ↓
...

关键数据结构：
- [结构体名] (定义: 文件路径:行号)

规范对应：
- [规范章节]

下一步建议：
1. [建议]
```

---

## compare - 规范对照

对比规范定义和源码实现。

步骤：
1. 在 `dds-standards/` 中搜索概念定义
2. 在 `cyclonedds/` 中搜索对应实现
3. 提取关键信息并对比
4. 标注差异和扩展

输出格式：
```
📊 规范-源码对照：[概念]

┌─────────────────────┬─────────────────────┐
│ DDS 规范            │ CycloneDDS 实现     │
├─────────────────────┼─────────────────────┤
│ [规范内容]          │ [实现代码]          │
└─────────────────────┴─────────────────────┘

关键实现文件：
- [文件路径]

建议深入：
1. [建议]
```

---

## session - 结束会话

保存学习记录并更新进度。

步骤：
1. 总结本次会话内容
2. 更新 `.claude/memory/learning-progress.md`
3. 更新 `.claude/memory/knowledge-map.md`
4. 创建会话记录文件 `sessions/YYYY-MM-DD-session-XX.md`
5. 创建 git commit

输出格式：
```
💾 保存学习会话

会话摘要：
- 主题：[主题]
- 学习时长：[时长]
- 代码追踪：X 个函数
- 规范对照：X 个概念

已保存：
✓ sessions/[文件名]
✓ .claude/memory/learning-progress.md (已更新)
✓ .claude/memory/knowledge-map.md (已更新)

Git 提交：
✓ [commit 信息]

下次学习建议：[建议]
```

---

## next - 获取建议

基于当前进度提供学习建议。

逻辑：
1. 读取学习进度
2. 分析当前阶段完成度
3. 提供 3 个选项：
   - 完成当前阶段
   - 预习下一阶段
   - 复习已学内容

输出格式：
```
💡 学习建议

基于你的当前进度（阶段 X: X%），建议：

选项 1：完成当前阶段 (推荐)
  主题：[主题]
  预计时间：[时间]
  学习资源：
    - 规范：[章节]
    - 源码：[文件]

选项 2：提前预习下一阶段
  ...

选项 3：复习巩固
  ...
```

---

## 实现说明

使用以下工具：
- **Read**: 读取 memory 文件和源码
- **Edit**: 更新 memory 文件
- **Write**: 创建会话记录
- **Grep**: 搜索源码和规范
- **Bash**: 执行 git 命令

关键文件：
- `.claude/memory/learning-progress.md`: 学习进度
- `.claude/memory/knowledge-map.md`: 知识图谱
- `cyclonedds/`: 源码目录
- `dds-standards/`: 规范文档目录

---

## 执行流程

当用户调用 `/cyclonedds-study [subcommand] [args]` 时：

1. **读取学习进度**
   ```
   使用 Read 工具读取 .claude/memory/learning-progress.md
   ```

2. **根据子命令执行**
   - `start`: 显示当前进度和建议，或开始指定主题学习
   - `progress`: 可视化显示学习进度
   - `trace`: 追踪代码调用链
   - `compare`: 对比规范和实现
   - `session`: 保存会话记录
   - `next`: 提供学习建议

3. **更新状态**（如需要）
   ```
   使用 Edit 工具更新 memory 文件
   ```

现在开始执行用户的命令。
