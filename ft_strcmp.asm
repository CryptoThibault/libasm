global ft_strcmp

section .note.GNU-stack noalloc noexec nowrite

section .text
ft_strcmp:
.loop:
    mov al, [rdi]           ; char c1 = *s1;
    mov bl, [rsi]           ; char c2 = *s2;
    cmp al, bl              ; if (c1 != c2)
    jne .diff               ; goto .diff;
    test al, al             ; if (c1 == '\0')
    je .equal               ; goto .equal;
    inc rdi                 ; s1++;
    inc rsi                 ; s2++;
    jmp .loop               ; goto .loop;
.diff:
    movzx eax, al           ; int eax = (unsigned char)c1;
    movzx ecx, bl           ; int ecx = (unsigned char)c2;
    sub eax, ecx            ; eax = eax - ecx;
    ret                     ; return eax;
.equal:
    xor eax, eax            ; int eax = 0;
    ret                     ; return eax;