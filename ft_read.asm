section .text
    global ft_read
    extern __errno_location

ft_read:
    xor rax, rax            ; ssize_t rax = 0 (SYS_read)
    syscall                 ; read(fd, buf, count)
    test rax, rax           ; if (rax < 0)
    js .error               ; goto .error
    ret                     ; return rax
.error:
    neg rax                 ; int err = -rax
    mov edi, eax            ; int tmp = err
    call __errno_location   ; int *p = __errno_location()
    mov dword [rax], edi    ; *p = tmp
    mov rax, -1             ; rax = -1
    ret                     ; return rax

section .note.GNU-stack noalloc noexec nowrite