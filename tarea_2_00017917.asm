	org 100h
	
	mov AX, 1d
	add AX, 7d
	add AX, 9d
	add AX, 1d
	add AX, 7d
	mov CX, 5d
	div CX

	mov cl, "E"
	mov [200h], cl
	mov cl, "n"
	mov [201h], cl
	mov cl, "E"
	mov [202h], cl
	mov cl, "l"
	mov [203h], cl
	mov cl, "S"
	mov [204h], cl
	mov cl, "e"
	mov [205h], cl
	mov cl, "g"
	mov [206h], cl
	mov cl, "u"
	mov [207h], cl
	mov cl, "n"
	mov [208h], cl
	mov cl, "d"
	mov [209h], cl
	mov cl, "o"
	mov [20Ah], cl
	



	mov AX, 2d
	mov BX, 2d
	mov CX, 0d
	mov SI, 0d

check1:	mul BX
 	mov [SI+210h], AX
	inc SI

	cmp AX, 100h
	jb check1

check2: inc SI
	mul BX
	mov [SI+210h], AX
	inc SI

	cmp AX, 1000h
	jb check2


	int 20h