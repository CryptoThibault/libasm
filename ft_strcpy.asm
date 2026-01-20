global ft_strcpy

section .note.GNU-stack noalloc noexec nowrite

section .text
ft_strcpy:
    mov rax, rdi            ; char *rax = dest;
.loop:
    mov bl, [rsi]           ; char c = *src;
    mov [rdi], bl           ; *dest = c;
    inc rsi                 ; src++;
    inc rdi                 ; dest++;
    test bl, bl             ; if (c != '\0')
    jne .loop               ; goto .loop;
    ret                     ; return rax;