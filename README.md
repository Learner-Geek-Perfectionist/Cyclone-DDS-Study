# 🌀 Cyclone DDS 学习仓库

一个使用苏格拉底式教学法学习 [Eclipse Cyclone DDS](https://github.com/eclipse-cyclonedds/cyclonedds) 的个人学习仓库。

## 📖 简介

Cyclone DDS 是 Eclipse 基金会下的高性能开源 DDS（Data Distribution Service）实现，广泛应用于：

- 🤖 **机器人操作系统 (ROS 2)** - 默认中间件选项之一
- 🚗 **自动驾驶** - 车载系统实时通信
- 🏭 **工业物联网** - 设备间数据分发
- 🎮 **实时仿真** - 分布式仿真系统

## 🗂️ 仓库结构

```
cyclone-dds-study/
├── cyclonedds/               # 官方源码 (git submodule)
│   ├── docs/                 # 官方文档
│   ├── examples/             # 官方示例
│   └── src/                  # 源码
├── progress/                 # 学习进度追踪
│   └── tracker.md
├── sessions/                 # 学习会话记录
│   └── SESSION-TEMPLATE.md
├── notes/                    # 学习笔记
├── examples/                 # 自己编写的示例代码
├── build/                    # 构建输出目录 (自动生成)
├── install/                  # 安装目录 (自动生成)
├── logs/                     # 构建日志 (自动生成)
├── pixi.toml                 # Pixi 依赖与任务管理
├── build.sh                  # 构建脚本
└── README.md
```

## 🚀 快速开始

### 1. 环境准备

```bash
# 安装 Pixi（如果未安装）
curl -fsSL https://pixi.sh/install.sh | bash

# 进入项目目录
cd cyclone-dds-study

# 激活开发环境
pixi shell
```

### 2. 编译 Cyclone DDS

```bash
# 完整编译
./build.sh build

# 编译并安装
./build.sh install

# 仅配置（不编译）
./build.sh cmake

# 清理并重新编译
./build.sh rebuild
```

### 3. 运行示例

```bash
# 终端 1：运行订阅者
pixi run hello-sub

# 终端 2：运行发布者
pixi run hello-pub

# 或者直接运行编译好的程序
./build/bin/HelloworldSubscriber
./build/bin/HelloworldPublisher
```

## 📚 学习方法

本仓库配置了 Cursor AI 导师规则，支持三种学习方式：

### 方式 A：段落引用学习（推荐）

1. 阅读官方文档的某段英文
2. 将其粘贴到对话中
3. AI 会翻译并讲解
4. 通过问答验证理解

### 方式 B：主题驱动学习

```
我想学习 [主题名称]
```

AI 会定位相关文档，用苏格拉底式问答引导学习。

### 方式 C：问题驱动学习

直接提出问题，AI 会找到相关文档并解答。

## 🎮 特殊指令

| 指令 | 功能 |
|------|------|
| `@文档 [名称]` | 打开并讲解指定文档 |
| `@目录` | 显示所有可用文档 |
| `@进度` | 显示学习进度 |
| `@复习` | 复习已学内容 |
| `@练习` | 基于当前内容出题 |
| `@总结` | 结束会话并保存进度 |
| `@源码 [路径]` | 查看并解释源码 |
| `@编译` | 显示编译帮助 |
| `@示例` | 列出可运行示例 |

## 📊 学习路径

```
阶段 1: 基础入门 (1-2 周)
    ├── DDS 概念与架构
    ├── 环境安装配置
    ├── HelloWorld 示例
    └── 基本 API 使用

阶段 2: 核心掌握 (2-3 周)
    ├── IDL 数据类型定义
    ├── QoS 策略详解
    ├── Discovery 机制
    └── 自定义应用开发

阶段 3: 进阶应用 (2-3 周)
    ├── 性能调优
    ├── 安全配置
    ├── ROS 2 集成
    └── 多语言绑定

阶段 4: 深入源码 (持续)
    ├── RTPS 协议实现
    ├── 核心数据结构
    └── 内存管理
```

## 🔗 相关资源

- 📖 [Cyclone DDS 官方文档](https://cyclonedds.io/docs/)
- 💻 [GitHub 仓库](https://github.com/eclipse-cyclonedds/cyclonedds)
- 🔧 [C++ 绑定](https://github.com/eclipse-cyclonedds/cyclonedds-cxx)
- 🐍 [Python 绑定](https://github.com/eclipse-cyclonedds/cyclonedds-python)
- 📋 [OMG DDS 规范](https://www.omg.org/spec/DDS/)
- 🤖 [ROS 2 文档](https://docs.ros.org/)

## 📝 License

本学习仓库仅供个人学习使用。Cyclone DDS 源码遵循 [Eclipse Public License 2.0](https://www.eclipse.org/legal/epl-2.0/)。
