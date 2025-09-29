#include "main.h"
#include <zlog.h>
#include <stdio.h>

void hello(void *zlog_cat) {
    zlog_info((zlog_category_t *)zlog_cat, "hello: Hello, World!");
    printf("Hello, World!\n");
}
