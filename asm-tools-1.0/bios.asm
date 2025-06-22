[bits 16]
putChar:
	mov ah, 0x0e
	int 0x10
	ret

putNL:
	mov ah, 0x0e
	mov al, 0x0D
	int 0x10
	mov al, 0x0A
	int 0x10
	ret

print:
	 mov ah, 0x0e
.repeat:
	lodsb
	cmp AL, 0
	je .done
	int 10h
	jmp .repeat
.done:
	ret


