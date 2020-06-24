org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	;VERTICALES
	mov 	si, 100d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	mov	bl, 150d
	call 	linea_v
	mov	si, 120d ; X -> Columna
	mov 	di, 110d ; Y -> Fila
	mov	bl, 150d
	call 	linea_v
	mov	si, 150d ; X -> Columna
	mov 	di, 90d; Y -> Fila
	mov	bl, 110d
	call 	linea_v
	mov	si, 120d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	mov	bl, 90d
	call 	linea_v
	mov	si, 170d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	mov	bl, 70d
	call 	linea_v

	;HORIZONTALES
	mov 	si, 100d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
	mov	bl, 120d
	call 	linea_h
	mov	si, 120d ; X -> Columna
	mov 	di, 110d ; Y -> Fila
	mov	bl, 150d
	call 	linea_h
	mov	si, 120d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
	mov	bl, 150d
	call 	linea_h
	mov	si, 120d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	mov	bl, 170d
	call 	linea_h
	mov	si, 100d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	mov	bl, 170d
	call 	linea_h
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
linea_v: 
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	lupi_v
	ret
linea_h:
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	lupi_h
	ret

section .data