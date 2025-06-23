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

time:
	mov ah, 0x2c
	int 0x21
	mov si, ch
	call print
	move al, '-'
	putChar
	move si, cl
	call print
	move al, '-'
	move si, dh
	call writeln
	ret

PRESS_ANY_KEY db "Press any key to continue...", 0