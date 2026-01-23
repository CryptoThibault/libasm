global ft_write
extern __errno_location

section .note.GNU-stack noalloc noexec nowrite

section .text
ft_write:
    mov rax, 1              ; ssize_t rax = 1; // SYS_write
    syscall                 ; write(fd, buf, count);
    test rax, rax           ; if (rax < 0)
    js .error               ; goto .error;
    ret                     ; return rax;
.error:
    neg rax                 ; int err = -rax;
    mov edi, eax            ; int tmp = err;
    call __errno_location   ; int *p = __errno_location();
    mov dword [rax], edi    ; *p = tmp;
    mov rax, -1             ; rax = -1;
    ret                     ; return rax;