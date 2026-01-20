global ft_read

section .note.GNU-stack noalloc noexec nowrite

section .text
ft_read:
    xor rax, rax            ; size_t rax = 0; (SYS_read)
    syscall                 ; read(fd, buf, count);
    ret                     ; return rax;