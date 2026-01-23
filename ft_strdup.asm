global ft_strdup
extern ft_strlen
extern malloc
extern ft_strcpy

section .note.GNU-stack noalloc noexec nowrite

section .text
ft_strdup:
    test rdi, rdi           ; if (src == NULL)
    je .null                ;     return NULL
    call ft_strlen          ; size_t len = ft_strlen(src);
    inc rax                 ; size_t rax = len + 1;
    mov rbx, rdi            ; char *save = src;
    mov rdi, rax            ; size_t size = rax;
    call malloc             ; char *ptr = malloc(size);
    test rax, rax           ; if (ptr == NULL)
    je .null                ;     return NULL;
    mov rdi, rax            ; char *dest = ptr;
    mov rsi, rbx            ; char *src = save;
    call ft_strcpy          ; ft_strcpy(dest, src);
    ret                     ; return dest;

.null:
    xor rax, rax            ; char *dest = NULL;
    ret                     ; return dest;