global ft_strcpy
section .text

ft_strcpy:
    mov rax, rdi            ; char *rax = dest;
.loop:
    mov bl, [rsi]           ; char c = *source;
    mov [rdi], bl           ; *dest = c;
    inc rsi                 ; src++;
    inc rdi                 ; dest++;
    test bl, bl             ; if (c == '\0')
    jne .loop               ; .loop;
    ret                     ; return rax;

section .note.GNU-stack noalloc noexec nowrite