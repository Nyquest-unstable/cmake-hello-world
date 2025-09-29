#include "main.h"

int main() {
    #include <zlog.h>
    int rc = zlog_init("zlog.conf");
    if (rc) {
        printf("zlog init failed!\n");
        return -1;
    }
    zlog_category_t *c = zlog_get_category("my_cat");
    if (!c) {
        printf("get zlog category failed!\n");
        zlog_fini();
        return -2;
    }
    zlog_info(c, "main: hello world start");
    hello(c);
    zlog_info(c, "main: hello world end");
    zlog_fini();
    return 0;
}
