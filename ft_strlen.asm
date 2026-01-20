global ft_strlen

section .note.GNU-stack noalloc noexec nowrite

section .text
ft_strlen:
    xor rax, rax            ; size_t rax = 0;
    cmp byte [rdi], 0       ; if (str[0] == '\0')
    je .end                 ; goto .end;
.loop:
    cmp byte [rdi + rax], 0 ; if (str[rax] == '\0')
    je .end                 ; goto .end;
    inc rax                 ; rax++;
    jmp .loop               ; goto .loop;
.end:
    ret                     ; return rax;