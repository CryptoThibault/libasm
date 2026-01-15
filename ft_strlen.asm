global ft_strlen
section .text

ft_strlen:
    xor rax, rax            ; size_t rax = 0;
    cmp byte [rdi], 0       ; if (str[0] == '\0')
    je .end                 ; .end;
.loop:
    cmp byte [rdi + rax], 0 ; if (str[rax] == '\0')
    je .end                 ; .end;
    inc rax                 ; rax++;
    jmp .loop               ; .loop;
.end:
    ret                     ; return rax;

section .note.GNU-stack noalloc noexec nowrite