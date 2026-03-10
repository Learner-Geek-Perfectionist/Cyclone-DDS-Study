# CycloneDDS Study Skill 设计文档

## 1. 概述

### 1.1 目标
为刚开始接触 DDS 但希望深入理解 CycloneDDS 源码实现的学习者，提供一个自上而下的、结构化的学习辅助工具。

### 1.2 核心功能
- 引导式学习路径（自上而下架构学习）
- 代码追踪和分析工具
- 规范-源码对照工具
- 自动生成学习笔记和会话记录

### 1.3 设计原则
- **渐进式**：从宏观到微观，从概念到实现
- **关联式**：规范、源码、文档三者关联
- **自动化**：减少手动记录，专注学习本身
- **可追溯**：完整的学习轨迹和知识图谱

## 2. 整体架构

```
┌─────────────────────────────────────────────────────────┐
│           cyclonedds-study Skill (主入口)                │
├─────────────────────────────────────────────────────────┤
│  学习路径模块  │  代码追踪模块  │  规范对照模块  │  会话管理  │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│              Claude Code 原生能力                        │
├─────────────────────────────────────────────────────────┤
│  .claude/memory/     │  .claude/steering/  │  hooks/    │
│  - learning-progress │  - cyclonedds-      │  - session │
│  - knowledge-map     │    context          │    -end    │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│                   学习资源                               │
├─────────────────────────────────────────────────────────┤
│  cyclonedds/源码  │  dds-standards/规范  │  sessions/   │
└─────────────────────────────────────────────────────────┘
```

## 3. 学习路径设计

### 3.1 四阶段学习路径

**阶段 1：宏观架构理解（1-2周）**
```
目标：建立 DDS 和 CycloneDDS 的整体认知框架
├── DDS 规范整体架构
│   ├── DCPS 层概念模型
│   ├── RTPS 协议层概览
│   └── 数据流向理解
├── CycloneDDS 模块划分
│   ├── 目录结构解析
│   ├── 核心模块职责
│   └── 模块间依赖关系
└── 关键数据流
    ├── 发布-订阅流程
    ├── Discovery 流程
    └── 数据传输流程
```

**阶段 2：DCPS 层深入（2-3周）**
```
目标：理解 DDS 应用层 API 的实现机制
├── Entity 模型实现
│   ├── DomainParticipant
│   ├── Publisher/Subscriber
│   ├── DataWriter/DataReader
│   └── Topic
├── QoS 策略机制
│   ├── QoS 策略类型
│   ├── 策略组合规则
│   └── 源码实现分析
└── Discovery 机制
    ├── SPDP (Simple Participant Discovery)
    ├── SEDP (Simple Endpoint Discovery)
    └── 源码追踪
```

**阶段 3：RTPS 协议层（2-3周）**
```
目标：理解底层通信协议实现
├── 消息格式与序列化
│   ├── RTPS 消息结构
│   ├── CDR 序列化
│   └── 源码实现
├── 可靠性保证
│   ├── RELIABLE vs BEST_EFFORT
│   ├── ACK/NACK 机制
│   └── 重传逻辑
└── 网络传输层
    ├── UDP 多播/单播
    ├── 端口映射
    └── 网络栈集成
```

**阶段 4：底层实现（持续）**
```
目标：掌握性能关键实现细节
├── 内存管理
│   ├── 内存池设计
│   ├── 零拷贝机制
│   └── 资源回收
├── 并发控制
│   ├── 锁策略
│   ├── 无锁数据结构
│   └── 线程模型
└── 性能优化
    ├── 批处理机制
    ├── 缓存优化
    └── 网络优化
```

## 4. Skill 功能详细设计

### 4.1 命令接口

**主命令**：`/cyclonedds-study [subcommand] [args]`

#### 4.1.1 start - 开始学习
```bash
/cyclonedds-study start [topic]
```

**功能**：
- 无参数：显示当前学习阶段和建议主题
- 带参数：开始学习指定主题

**输出示例**：
```
📚 CycloneDDS 学习助手

当前阶段：阶段 1 - 宏观架构理解 (进度: 30%)
已完成：DDS 规范整体架构
进行中：CycloneDDS 模块划分

建议下一步：
1. 深入理解 src/core/ddsi/ 目录结构
2. 追踪 dds_create_participant 函数调用链
3. 对照 DDS 规范 2.2.1 节理解 DomainParticipant

开始学习？[输入主题名称或序号]
```

#### 4.1.2 trace - 代码追踪
```bash
/cyclonedds-study trace <function|file|concept>
```

**功能**：
- 追踪函数调用链
- 分析数据结构
- 关联规范章节

**示例**：
```bash
/cyclonedds-study trace dds_write
```

**输出**：
```
🔍 追踪：dds_write

调用链：
dds_write (src/core/ddsc/src/dds_write.c:123)
  ↓
dds_write_impl
  ↓
ddsi_write_sample (src/core/ddsi/src/ddsi_transmit.c:456)
  ↓
create_fragment_message
  ↓
nn_xmsg_submit (src/core/ddsi/src/ddsi_xmsg.c:789)
  ↓
udp_send

关键数据结构：
- struct dds_writer (定义: src/core/ddsc/src/dds__writer.h:45)
- struct ddsi_writer (定义: src/core/ddsi/src/ddsi__entity.h:234)
- struct nn_xmsg (定义: src/core/ddsi/src/ddsi__xmsg.h:67)

规范对应：
- DDS 规范 2.2.2.4.2.11 write 操作
- RTPS 规范 8.3.7.2 DATA 消息

下一步建议：
1. 深入 ddsi_write_sample 实现细节
2. 理解 nn_xmsg 消息构建机制
3. 对照 RTPS 规范理解 DATA 消息格式
```

#### 4.1.3 compare - 规范对照
```bash
/cyclonedds-study compare <concept>
```

**功能**：
- 并排显示规范定义和源码实现
- 高亮差异和扩展
- 解释设计决策

**示例**：
```bash
/cyclonedds-study compare QoS-Reliability
```

**输出**：
```
📊 规范-源码对照：QoS Reliability

┌─────────────────────────────────────┬─────────────────────────────────────┐
│ DDS 规范 (2.2.3.4)                  │ CycloneDDS 实现                     │
├─────────────────────────────────────┼─────────────────────────────────────┤
│ RELIABLE: 保证数据可靠传输          │ struct dds_reliability_qospolicy    │
│ - 使用 ACK/NACK 协议                │ {                                   │
│ - 支持重传机制                      │   dds_reliability_kind_t kind;      │
│                                     │   dds_duration_t max_blocking_time; │
│ BEST_EFFORT: 尽力而为传输           │ }                                   │
│ - 不保证可靠性                      │                                     │
│ - 无重传                            │ 实现位置:                           │
│                                     │ src/core/ddsc/include/dds/dds.h:567 │
├─────────────────────────────────────┼─────────────────────────────────────┤
│ 规范要求的行为                      │ CycloneDDS 扩展                     │
├─────────────────────────────────────┼─────────────────────────────────────┤
│ - Writer 维护历史缓存               │ ✓ 实现了历史缓存 (whc)             │
│ - Reader 发送 ACK/NACK               │ ✓ 实现了 ACK/NACK 机制              │
│ - 支持 max_blocking_time            │ ✓ 支持阻塞超时                      │
│                                     │ + 额外支持同步/异步模式             │
│                                     │ + 优化了重传算法                    │
└─────────────────────────────────────┴─────────────────────────────────────┘

关键实现文件：
- src/core/ddsi/src/ddsi_whc.c (Writer History Cache)
- src/core/ddsi/src/ddsi_acknack.c (ACK/NACK 处理)

建议深入：
1. 阅读 ddsi_whc.c 理解历史缓存实现
2. 追踪 ACK/NACK 消息处理流程
3. 对比 RTPS 规范 8.3.7.4 理解协议细节
```

#### 4.1.4 progress - 查看进度
```bash
/cyclonedds-study progress
```

**输出**：
```
📈 学习进度

阶段 1: 宏观架构理解 ████████░░ 80%
  ✓ DDS 规范整体架构
  ✓ CycloneDDS 模块划分
  ⚡ 关键数据流 (进行中)

阶段 2: DCPS 层深入 ███░░░░░░░ 30%
  ✓ Entity 模型实现
  ⚡ QoS 策略机制 (进行中)
  ○ Discovery 机制

阶段 3: RTPS 协议层 ░░░░░░░░░░ 0%
  ○ 消息格式与序列化
  ○ 可靠性保证
  ○ 网络传输层

阶段 4: 底层实现 ░░░░░░░░░░ 0%
  ○ 内存管理
  ○ 并发控制
  ○ 性能优化

总体进度: 27.5%
学习天数: 12 天
会话数: 8 次

建议下一步：完成"关键数据流"学习，然后进入 QoS 策略深入研究
```

#### 4.1.5 session - 结束会话
```bash
/cyclonedds-study session
```

**功能**：
- 生成会话笔记
- 更新学习进度
- 创建 git commit

**输出**：
```
💾 保存学习会话

会话摘要：
- 主题：QoS Reliability 机制
- 学习时长：45 分钟
- 代码追踪：3 个函数
- 规范对照：2 个概念
- 新增笔记：1200 字

已保存：
✓ sessions/2026-03-10-session-16.md
✓ .claude/memory/learning-progress.md (已更新)
✓ .claude/memory/knowledge-map.md (已更新)

Git 提交：
✓ [study] QoS Reliability 机制学习

下次学习建议：深入 ACK/NACK 协议实现
```

#### 4.1.6 next - 获取建议
```bash
/cyclonedds-study next
```

**输出**：
```
💡 学习建议

基于你的当前进度（阶段 1: 80%），建议：

选项 1：完成当前阶段 (推荐)
  主题：关键数据流 - 数据传输流程
  预计时间：1-2 小时
  学习资源：
    - 规范：RTPS 8.3.7 DATA 消息
    - 源码：src/core/ddsi/src/ddsi_transmit.c
    - 示例：examples/helloworld/

选项 2：提前预习下一阶段
  主题：Entity 模型实现 - DomainParticipant
  预计时间：2-3 小时
  学习资源：
    - 规范：DDS 2.2.1 DomainParticipant
    - 源码：src/core/ddsc/src/dds_participant.c

选项 3：复习巩固
  建议复习：DDS 规范整体架构
  原因：距离上次学习已 5 天

你想学习哪个？[输入序号]
```

## 5. 配置文件设计

### 5.1 Memory 文件

#### learning-progress.md
```markdown
# CycloneDDS 学习进度

## 当前状态
- 阶段：1 (宏观架构理解)
- 进度：80%
- 开始日期：2026-03-01
- 学习天数：12

## 阶段完成情况

### 阶段 1: 宏观架构理解 (80%)
- [x] DDS 规范整体架构 (2026-03-02)
- [x] CycloneDDS 模块划分 (2026-03-05)
- [ ] 关键数据流 (进行中)

### 阶段 2: DCPS 层深入 (30%)
- [x] Entity 模型实现 (2026-03-08)
- [ ] QoS 策略机制 (进行中)
- [ ] Discovery 机制

### 阶段 3: RTPS 协议层 (0%)
### 阶段 4: 底层实现 (0%)

## 最近学习
- 2026-03-10: QoS Reliability 机制
- 2026-03-09: Entity 模型 - DataWriter
- 2026-03-08: Entity 模型 - DomainParticipant

## 下次建议
完成"关键数据流"学习
```

#### knowledge-map.md
```markdown
# CycloneDDS 知识图谱

## 核心概念关系

DDS Architecture
├── DCPS Layer
│   ├── DomainParticipant → 已学习 ✓
│   ├── Publisher/Subscriber → 已学习 ✓
│   ├── DataWriter/DataReader → 已学习 ✓
│   ├── Topic → 已学习 ✓
│   └── QoS Policies
│       ├── Reliability → 学习中 ⚡
│       ├── Durability → 待学习 ○
│       └── History → 待学习 ○
└── RTPS Layer
    ├── RTPS Messages → 待学习 ○
    ├── Discovery Protocol → 待学习 ○
    └── Reliability Protocol → 待学习 ○

## 源码映射

### DCPS → 源码
- DomainParticipant → src/core/ddsc/src/dds_participant.c
- DataWriter → src/core/ddsc/src/dds_writer.c
- QoS → src/core/ddsc/src/dds_qos.c

### RTPS → 源码
- Discovery → src/core/ddsi/src/ddsi_discovery.c
- Transmit → src/core/ddsi/src/ddsi_transmit.c

## 关键函数追踪

### 已追踪
- dds_create_participant → 创建参与者
- dds_create_writer → 创建写入器
- dds_write → 写入数据 (部分)

### 待追踪
- ddsi_write_sample → 底层写入
- handle_acknack → ACK/NACK 处理
```

### 5.2 Steering 文件

#### cyclonedds-context.md
```markdown
---
inclusion: always
---

# CycloneDDS 学习上下文

你正在辅助用户学习 CycloneDDS 源码实现。

## 项目结构
- `cyclonedds/`: CycloneDDS 源码
- `dds-standards/`: OMG DDS/RTPS 规范文档
- `sessions/`: 学习会话记录
- `.claude/memory/`: 学习进度和知识图谱

## 学习方法
- **自上而下**：从架构到细节
- **规范-源码对照**：理解设计决策
- **追踪式学习**：跟踪代码执行路径

## 关键原则
1. 始终关联规范和源码
2. 构建知识图谱，建立概念联系
3. 记录学习轨迹，便于回顾
4. 提供下一步学习建议

## 当前学习阶段
从 `.claude/memory/learning-progress.md` 读取最新进度。

## 响应格式
使用 `/cyclonedds-study` skill 提供的结构化输出格式。
```

### 5.3 Hook 配置

#### session-end hook
```json
{
  "name": "CycloneDDS 学习会话结束",
  "trigger": "onMessageSend",
  "pattern": "/cyclonedds-study session",
  "action": {
    "type": "agent",
    "prompt": "执行会话保存流程：生成笔记、更新进度、创建 commit"
  }
}
```

## 6. 使用流程示例

### 6.1 典型学习会话

```bash
# 1. 开始学习
/cyclonedds-study start

# 输出：显示当前进度和建议

# 2. 选择主题学习（假设选择 QoS Reliability）
/cyclonedds-study start QoS-Reliability

# 输出：提供学习材料和引导问题

# 3. 追踪相关代码
/cyclonedds-study trace ddsi_whc_insert

# 输出：显示调用链和数据结构

# 4. 对照规范理解
/cyclonedds-study compare Reliability

# 输出：规范-源码对照表

# 5. 查看进度
/cyclonedds-study progress

# 输出：更新后的学习进度

# 6. 结束会话
/cyclonedds-study session

# 输出：保存笔记、更新进度、创建 commit
```

### 6.2 进阶使用

```bash
# 深度追踪复杂函数
/cyclonedds-study trace dds_write --depth 5

# 对比多个概念
/cyclonedds-study compare Reliability vs Durability

# 查看知识图谱
/cyclonedds-study map

# 复习已学内容
/cyclonedds-study review Entity-Model
```

## 7. 实现计划

### 7.1 第一阶段：核心 Skill
- [ ] 创建 skill 文件结构
- [ ] 实现 start 命令
- [ ] 实现 trace 命令
- [ ] 实现 compare 命令
- [ ] 实现 progress 命令
- [ ] 实现 session 命令

### 7.2 第二阶段：配置文件
- [ ] 创建 memory 文件模板
- [ ] 创建 steering 文件
- [ ] 配置 hooks

### 7.3 第三阶段：学习路径内容
- [ ] 编写阶段 1 学习材料
- [ ] 编写阶段 2 学习材料
- [ ] 编写阶段 3 学习材料
- [ ] 编写阶段 4 学习材料

### 7.4 第四阶段：优化和扩展
- [ ] 添加交互式问答
- [ ] 添加可视化知识图谱
- [ ] 添加学习统计分析
- [ ] 集成 GitHub 上的相关 skills

## 8. 参考资源

### 8.1 GitHub 上的相关 Skills
搜索关键词：
- "code learning skill"
- "codebase exploration skill"
- "documentation skill"
- "study assistant skill"

### 8.2 可借鉴的设计
- `doc-coauthoring`: 结构化文档创作流程
- `skill-creator`: skill 创建和优化
- `trace` (如果存在): 代码追踪功能

## 9. 后续扩展方向

1. **可视化增强**
   - 生成调用链图表
   - 生成架构图
   - 生成知识图谱可视化

2. **交互式学习**
   - 苏格拉底式问答
   - 练习题生成
   - 理解检查

3. **社区集成**
   - 分享学习笔记
   - 导入他人的学习路径
   - 协作学习

4. **AI 增强**
   - 自动识别学习难点
   - 个性化学习路径调整
   - 智能推荐相关资源
