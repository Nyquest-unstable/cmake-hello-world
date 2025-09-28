
cmake_minimum_required(VERSION 3.10)
project(helloworld)

include_directories(inc)
# 自动扫描 src 目录下所有 .c 文件
file(GLOB SRC_FILES src/*.c)
add_executable(helloworld ${SRC_FILES})
