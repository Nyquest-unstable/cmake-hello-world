# hello_world CMake 工程模板

## 目录结构
- `open_src/`：存放开源代码，每个开源项目有独立 CMakeLists.txt
- `project/`：存放自己编写的代码，每个子项目有独立 CMakeLists.txt
- `lib/`：存放第三方库文件（如 .so 等）
- `temp/`：CMake 构建临时文件夹
- `CMakeLists.txt`：总领项目的 CMake 管理文件
- `build.sh`：一键构建脚本

## 使用方法
1. 将开源代码放入 `open_src/`，并补充对应 CMakeLists.txt
2. 将自己代码放入 `project/`，并补充对应 CMakeLists.txt
3. 第三方库文件放入 `lib/`
4. 执行 `./build.sh` 即可自动构建，构建产物在 `temp/` 目录下

## 说明
- 每个子项目都可独立管理和集成
- 可方便集成第三方库和开源代码
- 支持多模块扩展
