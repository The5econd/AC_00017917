org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	;VERTICALES
	mov 	si, 100d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea1v
	mov	si, 120d ; X -> Columna
	mov 	di, 110d ; Y -> Fila
	call 	linea3v
	mov	si, 150d ; X -> Columna
	mov 	di, 90d; Y -> Fila
	call 	linea5v
	mov	si, 120d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	call 	linea7v
	mov	si, 170d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea9v

	;HORIZONTALES
	mov 	si, 100d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
	call 	linea2h
	mov	si, 120d ; X -> Columna
	mov 	di, 110d ; Y -> Fila
	call 	linea4h
	mov	si, 120d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
	call 	linea6h

	mov	si, 120d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	call 	linea8h

	mov	si, 100d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea10h
	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret
kb: 	mov	ah, 00h
	int 	16h
	ret
linea1v: 
lupi1:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 150d
	jne 	lupi1
	ret
linea2h:
lupi2:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 120d
	jne 	lupi2
	ret

linea3v: 
lupi3:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 150d
	jne 	lupi3
	ret
linea4h:
lupi4:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 150d
	jne 	lupi4
	ret
linea5v: 
lupi5:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 110d
	jne 	lupi5
	ret
linea6h:
lupi6:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 150d
	jne 	lupi6
	ret
linea7v: 
lupi7:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 90d
	jne 	lupi7
	ret
linea8h:
lupi8:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 170d
	jne 	lupi8
	ret
linea9v: 
lupi9:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 70d
	jne 	lupi9
	ret
linea10h:
lupi10:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 170d
	jne 	lupi10
	ret
section .data