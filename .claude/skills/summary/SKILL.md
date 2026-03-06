---
name: summary
description: 结束会话，更新进度、创建会话记录、git 提交推送
disable-model-invocation: true
---

# 会话总结与提交

当用户调用此技能时，必须依次完成以下三个步骤，缺一不可。

## 步骤 1：更新 progress/tracker.md

读取当前 `progress/tracker.md`，根据本次会话内容更新：

- 更新「总体进度」表格（当前阶段描述、完成度百分比、学习天数、会话次数）
- 更新模块学习状态（❓ -> 🔄 -> ✅）
- 在「已掌握技能」对应小节下新增本次学到的技能（格式：`- [x] 理解 ...`）
- 将未解决的问题添加到「遗留问题」
- 在「学习笔记索引」表格末尾添加新行

## 步骤 2：创建会话记录

确定会话编号：查看 `sessions/` 目录中最新的 session 编号，+1。

创建文件 `sessions/YYYY-MM-DD-session-XX.md`，使用 `sessions/SESSION-TEMPLATE.md` 格式，填入：

- 日期、会话编号、时长估计
- 本次目标（勾选已完成的）
- 学习主题（每个主题含核心概念、理解要点）
- 心得体会
- 遗留问题
- 参考资料（源码路径:行号、规范章节）
- 下次目标
- 进度更新表（模块状态变化）

## 步骤 3：Git 提交并推送

依次执行：

1. `git add progress/tracker.md sessions/YYYY-MM-DD-session-XX.md`
   - 如有新 SVG 图表或其他本次变更的文件也一并 add
2. `git commit -m "session-XX: 知识点1, 知识点2, 知识点3"`
   - 摘要用逗号分隔列出 2-4 个核心知识点（中文）
   - 示例: `session-16: reorder sampletree源码, dqueue投递机制, 发送路径概览`
3. `git push`

## 注意事项

- 三个步骤必须全部完成后才向用户确认
- 会话记录使用简体中文
- commit message 中的知识点摘要使用中文
- 如果 git push 失败，告知用户原因并建议手动处理
