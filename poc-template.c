/*
 * vim:ts=4:sw=4:expandtab
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <errno.h>

#define LOGERR(...) {fprintf(stderr, "[%s:%d] %s: ", __FILE__, __LINE__, __func__); fprintf(stderr, __VA_ARGS__);}

#ifdef DEBUGBUILD
#define DBGTRC(...) LOGERR(__VA_ARGS__)
#else
#define DBGTRC(...)
#endif

int main(int argc, char **argv) {
    return EXIT_SUCCESS;
}
