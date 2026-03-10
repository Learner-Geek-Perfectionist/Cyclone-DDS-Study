---
name: cyclonedds-session
description: 结束 CycloneDDS 学习会话 - 自动生成笔记、更新进度、创建 git commit
---

# cyclonedds-session - 结束会话

结束当前学习会话，自动保存所有学习记录。

## 参数

```
/cyclonedds-session
```

无参数。

## 执行步骤

### 1. 回顾本次会话

分析当前对话历史，提取：
- 学习的主题
- 追踪的函数/代码
- 对照的规范概念
- 关键发现和理解

### 2. 生成会话笔记

确定会话编号：检查 `sessions/` 目录中已有的文件。

创建 `sessions/YYYY-MM-DD-session-XX.md`：

```markdown
# 学习会话 XX - YYYY-MM-DD

## 学习主题
[主题名称]

## 学习内容

### 规范学习
- [学到的规范知识]

### 源码分析
- [分析的源码和理解]

### 代码追踪
- [追踪的函数和调用链]

## 关键发现
1. [发现 1]
2. [发现 2]

## 疑问与待探索
- [未解决的问题]

## 下次学习建议
- [建议的下一步]
```

### 3. 更新学习进度

使用 Edit 工具更新 `.claude/memory/learning-progress.md`：
- 将已完成的主题标记为 `[x]` 并添加日期
- 将正在学习的主题标记为"进行中"
- 更新"最近学习"列表
- 更新"下次建议"

### 4. 更新知识图谱

使用 Edit 工具更新 `.claude/memory/knowledge-map.md`：
- 将新学习的概念状态改为 `已学习 ✓` 或 `学习中 ⚡`
- 添加新发现的源码映射
- 将追踪过的函数移至"已追踪"部分

### 5. 创建 git commit

```bash
git add sessions/ .claude/memory/
git commit -m "[study] [主题名称] 学习会话"
```

### 6. 输出摘要

```
💾 保存学习会话

会话摘要：
- 主题：[主题]
- 代码追踪：X 个函数
- 规范对照：X 个概念

已保存：
✓ sessions/YYYY-MM-DD-session-XX.md
✓ .claude/memory/learning-progress.md (已更新)
✓ .claude/memory/knowledge-map.md (已更新)

Git 提交：
✓ [study] [主题] 学习会话

💡 下次学习建议：[建议]
   使用 /cyclonedds-start 开始下一次学习
```

## 关键文件

- `sessions/`: 会话记录目录
- `.claude/memory/learning-progress.md`: 学习进度
- `.claude/memory/knowledge-map.md`: 知识图谱
