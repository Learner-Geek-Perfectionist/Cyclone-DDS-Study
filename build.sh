#!/bin/bash
#
# Cyclone DDS 构建脚本
# 用法: ./build.sh [命令] [CMake选项...]
#
# 命令:
#   cmake    - 仅配置（运行 CMake）
#   build    - 配置 + 编译（默认）
#   install  - 编译 + 安装到 install/
#   clean    - 清理构建目录
#   rebuild  - 清理 + 重新编译
#   help     - 显示帮助信息
#
# 选项:
#   --no-log - 禁用日志文件，保持终端颜色输出
#
# 示例:
#   ./build.sh                              # 默认编译
#   ./build.sh cmake -DCMAKE_BUILD_TYPE=Debug
#   ./build.sh build -DBUILD_EXAMPLES=ON
#   ./build.sh install
#   ./build.sh --no-log build
#

set -e

# 项目目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/cyclonedds"
BUILD_DIR="$SOURCE_DIR/build"
INSTALL_DIR="$SOURCE_DIR/install"
LOG_DIR="$SOURCE_DIR/logs"

# 默认选项
USE_LOG=true
COMMAND="build"
CMAKE_ARGS=""

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 显示帮助
show_help() {
    echo "Cyclone DDS 构建脚本"
    echo ""
    echo "用法: ./build.sh [选项] [命令] [CMake选项...]"
    echo ""
    echo "命令:"
    echo "  cmake    - 仅配置（运行 CMake）"
    echo "  build    - 配置 + 编译（默认）"
    echo "  install  - 编译 + 安装到 install/"
    echo "  clean    - 清理构建目录"
    echo "  rebuild  - 清理 + 重新编译"
    echo "  help     - 显示此帮助信息"
    echo ""
    echo "选项:"
    echo "  --no-log - 禁用日志文件，保持终端颜色输出"
    echo ""
    echo "CMake 常用选项:"
    echo "  -DCMAKE_BUILD_TYPE=Debug|Release|RelWithDebInfo  # 默认 Debug"
    echo "  -DBUILD_EXAMPLES=ON|OFF          # 默认 ON"
    echo "  -DBUILD_TESTING=ON|OFF           # 编译测试"
    echo "  -DENABLE_SECURITY=ON|OFF         # 启用 DDS Security"
    echo "  -DENABLE_SSL=ON|OFF              # 启用 SSL 支持"
    echo "  -DBUILD_IDLC=ON|OFF              # 编译 IDL 编译器"
    echo ""
    echo "示例:"
    echo "  ./build.sh                                    # 默认编译"
    echo "  ./build.sh cmake -DCMAKE_BUILD_TYPE=Debug     # Debug 配置"
    echo "  ./build.sh build -DBUILD_EXAMPLES=ON          # 编译示例"
    echo "  ./build.sh --no-log build                     # 编译（保持颜色）"
    echo "  ./build.sh install                            # 安装到 install/"
}

# 解析参数
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --no-log)
                USE_LOG=false
                shift
                ;;
            cmake|build|install|clean|rebuild|help)
                COMMAND=$1
                shift
                ;;
            -D*)
                CMAKE_ARGS="$CMAKE_ARGS $1"
                shift
                ;;
            *)
                log_warn "未知参数: $1"
                shift
                ;;
        esac
    done
}

# 检查源码目录
check_source() {
    if [ ! -d "$SOURCE_DIR" ]; then
        log_error "源码目录不存在: $SOURCE_DIR"
        log_info "请先克隆 Cyclone DDS 仓库:"
        echo "  git clone https://github.com/eclipse-cyclonedds/cyclonedds.git"
        exit 1
    fi
    
    if [ ! -f "$SOURCE_DIR/CMakeLists.txt" ]; then
        log_error "无效的源码目录，找不到 CMakeLists.txt"
        exit 1
    fi
}

# CMake 配置
do_cmake() {
    check_source
    
    log_info "配置 CMake..."
    mkdir -p "$BUILD_DIR"
    
    local cmake_cmd="cmake -B $BUILD_DIR -S $SOURCE_DIR \
        -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_BUILD_TYPE=Debug \
        -DBUILD_EXAMPLES=ON \
        $CMAKE_ARGS"
    
    log_info "CMake 命令: $cmake_cmd"
    
    if $USE_LOG; then
        mkdir -p "$LOG_DIR"
        local log_file="$LOG_DIR/cmake-$(date +%Y%m%d-%H%M%S).log"
        log_info "日志文件: $log_file"
        eval $cmake_cmd 2>&1 | tee "$log_file"
    else
        eval $cmake_cmd
    fi
    
    # 复制 compile_commands.json 到根目录
    if [ -f "$BUILD_DIR/compile_commands.json" ]; then
        cp "$BUILD_DIR/compile_commands.json" "$SCRIPT_DIR/"
        log_success "已复制 compile_commands.json 到项目根目录"
    fi
    
    log_success "CMake 配置完成"
}

# 编译
do_build() {
    # 如果 build 目录不存在或没有 Makefile，先运行 cmake
    if [ ! -f "$BUILD_DIR/Makefile" ] && [ ! -f "$BUILD_DIR/build.ninja" ]; then
        do_cmake
    fi
    
    log_info "开始编译..."
    
    local build_cmd="cmake --build $BUILD_DIR --parallel $(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)"
    
    if $USE_LOG; then
        mkdir -p "$LOG_DIR"
        local log_file="$LOG_DIR/build-$(date +%Y%m%d-%H%M%S).log"
        log_info "日志文件: $log_file"
        eval $build_cmd 2>&1 | tee "$log_file"
    else
        eval $build_cmd
    fi
    
    log_success "编译完成"
}

# 安装
do_install() {
    do_build
    
    log_info "安装到 $INSTALL_DIR..."
    cmake --install "$BUILD_DIR"
    log_success "安装完成"
    
    log_info "安装路径: $INSTALL_DIR"
    log_info "可执行文件: $INSTALL_DIR/bin/"
    log_info "库文件: $INSTALL_DIR/lib/"
    log_info "头文件: $INSTALL_DIR/include/"
}

# 清理
do_clean() {
    log_info "清理构建目录..."
    rm -rf "$BUILD_DIR"
    rm -rf "$INSTALL_DIR"
    rm -f "$SCRIPT_DIR/compile_commands.json"
    log_success "清理完成"
}

# 重新编译
do_rebuild() {
    do_clean
    do_build
}

# 主函数
main() {
    parse_args "$@"
    
    case $COMMAND in
        help)
            show_help
            ;;
        cmake)
            do_cmake
            ;;
        build)
            do_build
            ;;
        install)
            do_install
            ;;
        clean)
            do_clean
            ;;
        rebuild)
            do_rebuild
            ;;
        *)
            log_error "未知命令: $COMMAND"
            show_help
            exit 1
            ;;
    esac
}

main "$@"
