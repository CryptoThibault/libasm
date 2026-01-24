section .text
    global ft_strdup
    extern ft_strlen
    extern malloc
    extern ft_strcpy

ft_strdup:
    test rdi, rdi           ; if (str == NULL)
    je .null                ; goto .null
    push rdi                ; (save str on stack)
    mov rdi, rdi            ; char *ptr = str
    call ft_strlen          ; size_t len = ft_strlen(ptr)
    inc rax                 ; len++
    mov rdi, rax            ; size_t size = len
    call malloc             ; char *dest = malloc(size)
    test rax, rax           ; if (dest == NULL)
    je .null                ; goto .null
    pop rsi                 ; char *src = str (restore from stack)
    mov rdi, rax            ; dest = ptr;
    call ft_strcpy          ; ft_strcpy(dest, src)
    ret                     ; return dest
.null:
    xor rax, rax            ; char *null_dest = NULL
    ret                     ; return null_dest

section .note.GNU-stack noalloc noexec nowrite