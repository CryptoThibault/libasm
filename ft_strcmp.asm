section .text
    global ft_strcmp

ft_strcmp:
.loop:
    mov al, [rdi]           ; char c1 = *s1
    mov dl, [rsi]           ; char c2 = *s2
    cmp al, dl              ; if (c1 != c2)
    jne .diff               ; goto .diff
    test al, al             ; if (c1 == '\0')
    je .equal               ; goto .equal
    inc rdi                 ; s1++
    inc rsi                 ; s2++
    jmp .loop               ; goto .loop
.diff:
    movzx eax, al           ; int res = (unsigned char)c1
    movzx ecx, dl           ; int tmp = (unsigned char)c2
    sub eax, ecx            ; res = res - tmp
    ret                     ; return res
.equal:
    xor eax, eax            ; int res = 0
    ret                     ; return res

section .note.GNU-stack noalloc noexec nowrite