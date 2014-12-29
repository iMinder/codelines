#!/bin/bash
# 用于统计工程代码行数的脚本
help()
{
    cat <<HELP
    用于统计代码行数，会按照代码行数的大小顺序进行排序
    使用方法:codeline your_project_path

HELP
    exit 0
}

#main program
[ $# -lt 1 ] && help
# main program
DIR=$1
echo $DIR
if [ -d "$DIR" ]; then
    cd "$DIR"
    find . "(" -name "*.m" -or -name "*.mm" -or -name "*.cpp" \
    -or -name "*.c"  -or -name "*.h" ")" -print | xargs wc -l | sort
else
    echo "$DIR is not a directory"
    exit 1
fi
# find 查找符合后面的文件
# xrags 将find查找的分片传给wc，防止结果过长造成溢出
# wc -l 按行统计并输出结果
# sort 对结果进行排序

