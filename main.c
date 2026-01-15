#include <stdio.h>
#include <stddef.h>

size_t  ft_strlen(char *str);
char    *ft_strcpy(char *dest, const char *src);

int main() {
    printf("length: %ld\n", ft_strlen("Hello, World!")); // Expected output: 13

    char buf[32];
    printf("ret: %s\n", ft_strcpy(buf, "Hello, World!")); // Expected output: ret: Hello, World!
    printf("buf: %s\n", buf); // Expected output: buf: Hello, World!

    return 0;
}