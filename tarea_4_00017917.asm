org	100h

section .text
	call 	texto  	;iniciamos modo texto
main:	call 	instruccion
	
	xor	si, si	
loop1:	call 	kb
	cmp 	al, "e"
	je	operar1
	sub	al, 30h
	mov	[400h+si], al
	inc	si
	jmp 	loop1
;-------------------------------------------------------------------
texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret
kb:	mov	ah, 1h ;
	int 	21h	
	ret
;-------------------------------------------------------------------
operar1:	xor	si,si
	mov	ax, 0h
	mov	bl, 00h

sumar:	mov	cl, [400h+si]
	inc	si
	add	al, cl
	cmp	si, 5d
	je	dividir
	jmp	sumar
	
dividir:	mov	[410h], ax
	mov	bl, 5h
	div	bl
	mov	[500h], ax
	call	mostrar
;-------------------------------------------------------------------
mostrar:	mov	dx, nl
	call	w_string
	
	cmp	al, 1d
	je	anita1
	cmp	al, 2d
	je	anita2
	cmp	al, 3d
	je	anita3
	cmp	al, 4d
	je	anita4
	cmp	al, 5d
	je	anita5
	cmp	al, 6d
	je	anita6
	cmp	al, 7d
	je	anita7
	cmp	al, 8d
	je	anita8
	cmp	al, 9d
	je	anita9
	cmp	al, 10d
	je	anita10

anita1:	mov 	dx, msg1
	jmp	terminar
anita2:	mov 	dx, msg2
	jmp	terminar
anita3:	mov 	dx, msg3
	jmp	terminar
anita4:	mov 	dx, msg4
	jmp	terminar
anita5:	mov 	dx, msg5
	jmp	terminar
anita6:	mov 	dx, msg6
	jmp	terminar
anita7:	mov 	dx, msg7
	jmp	terminar
anita8:	mov 	dx, msg8
	jmp	terminar
anita9:	mov 	dx, msg9
	jmp	terminar
anita10:	mov 	dx, msg10
	jmp	terminar
;-------------------------------------------------------------------
terminar:	call	w_string
	call	kb
	int 	20h

w_string:	mov 	ah, 09
	int 	21h
	ret
;-------------------------------------------------------------------
instruccion:mov 	di, 0d
lupi:	mov 	cl, [msg+di]
	call    	m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 0d ; fila
	mov 	bh, 0h
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov	bl, 01000000b
	mov 	cx, 1h
	int 	10h
	ret
section .data
msg	db 	"ingrese carnet (sin incluir los 0) y aprete e:   "
len	equ	$-msg

msg1	db 	"Solo necesito el 0$"
msg2	db 	"Aun no se pasa$"
msg3	db 	"Hay salud $"
msg4	db 	"Me recupero$"
msg5	db 	"En el segundo$"
msg6	db 	"Peor es nada$"
msg7	db 	"Muy bien $"
msg8	db 	"Colocho$"
msg9	db 	"Siempre me esfuerzo$"
msg10	db 	"Perfecto solo dios$"
nl	db 	0xA, 0xD, "$"