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
	



	int 20h