section .text
    global ft_strlen

ft_strlen:
    xor rax, rax            ; size_t len = 0
    test rdi, rdi           ; if (str == NULL)
    je .end                 ; goto .end
.loop:
    cmp byte [rdi], 0       ; if (str[0] == '\0')
    je .end                 ; goto .end
    inc rdi                 ; str++
    inc rax                 ; len++
    jmp .loop               ; goto .loop
.end:
    ret                     ; return len

section .note.GNU-stack noalloc noexec nowrite