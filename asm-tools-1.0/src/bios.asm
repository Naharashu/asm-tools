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

writeln:
	call print
	call putNL
	ret

pressANYmsg:
	mov si, PRESS_ANY_KEY
	call writeln
	mov ah, 0x00
	int 0x16
	ret

pressANY:
	mov ah, 0x00
	int 0x16
	ret

printTD:
	push ax
	mov ah, 0
	mov bl, 10
	div bl
	add al, '0'
	call putChar
	mov al, ah
	add al, '0'
	call putChar
	pop ax
	ret

time:
	mov ah, 0x2c
	int 0x21
	mov al, ch
	call printTD
	mov al, '-'
	putChar
	mov al, cl
	call printTD
	mov al, '-'
	call putChar
	mov al, dh
	call printTD
	call putNL
	ret

PRESS_ANY_KEY db "Press any key to continue...", 0