section .text
global _start

_start:
	mov al,1 ;moves value 1 for write syscall into least 8 bits of rax register
	mov rdi,rax ; rdi holds the file descriptor to write the data
	mov rsi,msg ; rsi holds the message we need to write onto stdin
	mov dl,10 ; specify the length of the message to be written
	syscall

	mov al,60 ; syscall for exit
	xor rdi,rdi ; exit with 0 status code(exit(0))
	syscall
msg:
	db "[^0^] u!!",0
