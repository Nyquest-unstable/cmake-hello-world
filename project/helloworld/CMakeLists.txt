# 恢复 zlog 依赖设置
cmake_minimum_required(VERSION 3.10)
project(helloworld)

include_directories(inc)
include_directories(${CMAKE_SOURCE_DIR}/open_src/zlog/src)
file(GLOB SRC_FILES src/*.c)
add_executable(helloworld ${SRC_FILES})
target_link_libraries(helloworld zlog)

# 构建由顶层 CMakeLists.txt 统一管理，无需在此重复定义
