#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <errno.h>

size_t  ft_strlen(char *str);
char    *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t  ft_write(int fd, const void *buf, size_t count);
ssize_t  ft_read(int fd, void *buf, size_t count);
char    *ft_strdup(const char *str);

int main() {
    printf("Testing ft_strlen:\n");
    printf("length: %ld\n", ft_strlen("Hello, World!")); // Expected output: 13
    printf("length: %ld\n", ft_strlen("")); // Expected output: 0
    printf("length: %ld\n", ft_strlen(NULL)); // Expected output: 0

    printf("\nTesting ft_strcpy:\n");
    char buf[32];
    printf("ret: %s\n", ft_strcpy(buf, "Hello, World!")); // Expected output: ret: Hello, World!
    printf("buf: %s\n", buf); // Expected output: buf: Hello, World!
    printf("ret: %s\n", ft_strcpy(buf, "")); // Expected output: ret:
    printf("buf: %s\n", buf); // Expected output: buf:
    printf("ret: %s\n", ft_strcpy(buf, NULL)); // Expected output: ret: (null)
    printf("buf: %s\n", buf); // Expected output: buf:

    printf("\nTesting ft_strcmp:\n");
    printf("cmp1: %d\n", ft_strcmp("abc", "abc")); // Expected output: cmp1: 0
    printf("cmp2: %d\n", ft_strcmp("abc", "abd")); // Expected output: cmp2: -1
    printf("cmp3: %d\n", ft_strcmp("abd", "abc")); // Expected output: cmp3: 1
    printf("cmp4: %d\n", ft_strcmp("", "")); // Expected output: cmp4: 0

    printf("\nTesting ft_write:\n");
    const char *msg = "Hello, write!\n";
    ssize_t bytes_written = ft_write(1, msg, 14); // Writing to stdout
    printf("bytes_written: %ld\n", bytes_written); // Expected output: bytes_written: 14
    bytes_written = ft_write(-1, msg, 14); // Invalid fd
    printf("bytes_written (error case): %ld\n", bytes_written); // Expected output: bytes_written (error case): -1
    printf("errno (error case): %d\n", errno); // Expected output: errno (error case): 9

    printf("\nTesting ft_read:\n");
    char read_buf[32];
    ssize_t bytes_read = ft_read(0, read_buf, 31); // Reading from stdin
    read_buf[bytes_read] = '\0'; // Null-terminate the string
    printf("You read: %s", read_buf); // Expected output: You read: <input from user>
    printf("bytes_read: %ld\n", bytes_read); // Expected output: bytes_read: <number of bytes read>
    bytes_read = ft_read(-1, read_buf, 31); // Invalid fd
    printf("bytes_read (error case): %ld\n", bytes_read); // Expected output: bytes_read (error case): -1
    printf("errno (error case): %d\n", errno); // Expected output: errno (error case): 9

    printf("\nTesting ft_strdup:\n");
    char *dup = ft_strdup("Hello, World!");
    printf("dup: %s\n", dup); // Expected output: dup: Hello, World!
    free(dup);
    char *dup_empty = ft_strdup("");
    printf("dup_empty: '%s'\n", dup_empty); // Expected output: dup_empty: ''
    free(dup_empty);
    char *dup_null = ft_strdup(NULL);
    printf("dup_null: %p\n", dup_null); // Expected output: dup_null: (nil)
    free(dup_null);

    return 0;
}