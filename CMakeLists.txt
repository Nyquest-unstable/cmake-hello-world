cmake_minimum_required(VERSION 3.10)
project(hello_world)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)   # .exe / 可执行脚本
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)   # .so / .dylib
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)   # .a / .lib
# 添加 open_src 子项目
add_subdirectory(open_src)
# 添加 project 子项目
add_subdirectory(project)

# lib 文件夹用于存放 .so 等库文件
# temp 文件夹用于存放构建临时文件
