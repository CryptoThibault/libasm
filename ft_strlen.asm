global ft_strlen

section .text
ft_strlen:
    mov rax, rdi      ; rax = premier argument (a)
    add rax, rsi      ; rax = rax + deuxième argument (b)
    ret               ; retourner rax
