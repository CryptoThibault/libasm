section .text
    global ft_strcpy

ft_strcpy:
    test rdi, rdi           ; if (dest == NULL)
    je .null                ; goto .null
    test rsi, rsi           ; if (src == NULL)
    je .null                ; goto .null
    mov rax, rdi            ; char *res = dest
.loop:
    mov bl, [rsi]           ; char c = *src
    mov [rdi], bl           ; *dest = c
    inc rsi                 ; src++
    inc rdi                 ; dest++
    test bl, bl             ; if (c != '\0')
    jne .loop               ; goto .loop
    ret                     ; return res
.null:
    xor rax, rax            ; char *res = NULL
    ret                     ; return res

section .note.GNU-stack noalloc noexec nowrite