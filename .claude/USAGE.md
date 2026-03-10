# CycloneDDS Study Skill 使用指南

## 🎉 安装完成

CycloneDDS 学习助手已成功安装！

## 📁 已创建的文件

```
.claude/
├── skills/cyclonedds-study/
│   └── SKILL.md                    # 主 skill 文件
├── memory/
│   ├── learning-progress.md        # 学习进度追踪
│   └── knowledge-map.md            # 知识图谱
├── steering/
│   └── cyclonedds-context.md       # 持久学习上下文
├── designs/
│   └── cyclonedds-study-skill.md   # 设计文档
└── plans/
    └── cyclonedds-study-implementation.md  # 实施计划
```

## 🚀 如何使用

### 重启 Claude Code

Skill 需要 Claude Code 重新加载才能使用。请：
1. 退出当前会话（输入 `/quit`）
2. 重新启动 `kiro-cli chat`
3. Skill 将自动加载

### 可用命令

```bash
/cyclonedds-study start           # 开始学习，显示当前进度和建议
/cyclonedds-study progress        # 查看学习进度
/cyclonedds-study trace <target>  # 追踪函数或文件
/cyclonedds-study compare <concept> # 规范-源码对照
/cyclonedds-study session         # 结束会话并保存
/cyclonedds-study next            # 获取学习建议
```

## 📚 学习路径

### 阶段 1：宏观架构理解（1-2周）
- DDS 规范整体架构
- CycloneDDS 模块划分
- 关键数据流

### 阶段 2：DCPS 层深入（2-3周）
- Entity 模型实现
- QoS 策略机制
- Discovery 机制

### 阶段 3：RTPS 协议层（2-3周）
- 消息格式与序列化
- 可靠性保证
- 网络传输层

### 阶段 4：底层实现（持续）
- 内存管理
- 并发控制
- 性能优化

## 💡 使用示例

### 开始学习
```bash
/cyclonedds-study start
```

### 追踪函数
```bash
/cyclonedds-study trace dds_write
```

### 规范对照
```bash
/cyclonedds-study compare QoS-Reliability
```

### 查看进度
```bash
/cyclonedds-study progress
```

### 结束会话
```bash
/cyclonedds-study session
```

## 🔧 自定义

### 修改学习进度
编辑 `.claude/memory/learning-progress.md`

### 添加知识点
编辑 `.claude/memory/knowledge-map.md`

### 调整学习上下文
编辑 `.claude/steering/cyclonedds-context.md`

## 📖 更多信息

- 设计文档：`.claude/designs/cyclonedds-study-skill.md`
- 实施计划：`.claude/plans/cyclonedds-study-implementation.md`

## 🎯 下一步

1. 重启 Claude Code
2. 运行 `/cyclonedds-study start` 开始学习
3. 享受结构化的学习体验！
