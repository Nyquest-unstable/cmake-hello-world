#!/bin/bash
set -e

PROJECT_DIR="$PWD"
TEMP_DIR="$PROJECT_DIR/temp"
OUT_DIR="$PROJECT_DIR/out"
PROJECTS_DIR="$PROJECT_DIR/project"

function list_projects() {
	find "$PROJECTS_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;
}

function show_help() {
	echo "用法: $0 [命令]"
	echo "命令选项:"
	echo "  help         显示帮助信息"
	echo "  all          编译所有模块"
	echo "  clean        清理构建临时文件和输出文件"
	echo "  <模块名>     仅编译指定模块 (如 helloworld)"
	echo "\n当前可用模块:"
	list_projects
}

function clean() {
	rm -rf "$TEMP_DIR" "$OUT_DIR"
	echo "已清理 temp 和 out 目录。"
}

function build_all() {
	mkdir -p "$TEMP_DIR"
	mkdir -p "$OUT_DIR"
	cd "$TEMP_DIR"
	cmake ..
	make
	# 确保 out 目录存在并使用绝对路径
	# OUT_DIR_ABS="$(cd "$OUT_DIR" && pwd)"
	# for exe in $(find . -maxdepth 5 -type f -executable); do
	# 	exe_name=$(basename "$exe")
	#     echo "$exe" 
	#     echo "$OUT_DIR"
	# 	cp "$exe" "$OUT_DIR"
	# done
    cp -vt "$OUT_DIR" "${TEMP_DIR}/bin/"*
	cd "$PROJECT_DIR"
	echo "构建完成，输出在 out 目录下。"
}

function build_module() {
	local module="$1"
	if [ ! -d "$PROJECTS_DIR/$module" ]; then
		echo "模块 $module 不存在。"
		exit 1
	fi
	mkdir -p "$TEMP_DIR/$module"
	mkdir -p "$OUT_DIR"
	cd "$TEMP_DIR/$module"
	cmake "$PROJECTS_DIR/$module"
	make
	# for exe in $(find "$TEMP_DIR/$module" -maxdepth 1 -type f -executable); do
	# 	exe_name=$(basename "$exe")
	# 	ln -sf "$exe" "$OUT_DIR/$exe_name" || cp "$exe" "$OUT_DIR/$exe_name"
	# done
    cp -vt "$OUT_DIR" "${TEMP_DIR}/$module/$module"
	cd "$PROJECT_DIR"
	echo "模块 $module 构建完成，输出在 out 目录下。"
}

case "$1" in
	help|--help|-h)
		show_help
		;;
	clean)
		clean
		;;
	all|"")
		build_all
		;;
	*)
		build_module "$1"
		;;
esac