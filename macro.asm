;=========================== Ini Obtener Texto ===========================
 	print macro cadena 
	    mov dx, offset cadena 
        call WriteString
    endm

    println macro cadena
        print cadena
        print salto
    endm

    read macro cadena
        mov dx,offset   cadena
        mov cx,lengthof cadena
        call ReadString
    endm

	imprimir macro
		call PrintAl
	endm

   	iniciarDs macro 
        mov ax,@data        ;pasamos la direccion de data a ax
        mov ds,ax           ;Inicializa DS
    endm

	getChar macro
		;mov ah,0dh
		;int 21h
		mov ah,01h
		int 21h
	endm
;=========================== Fin Obtener Texto ===========================

;=========================== Ini Ficheros ================================
	abrirF macro ruta, handle
		mov ah,3dh
		mov al,010b
		lea dx, ruta
		int 21h
		jc ErrorAbrir
		mov handle,ax
	endm

	leerF macro handle, numBytes, bufferOut
		mov ah,3fh
		mov bx,handle
		mov cx,numBytes
		lea dx, bufferOut
		int 21h
		jc ErrorLeer
	endm

	crearF macro ruta, handle
		mov ah, 3ch
		mov cx, 00h
		lea dx, ruta
		int 21h
		jc ErrorCrear
		mov handle, ax
	endm

	escribirF macro handle, numBytes, buffer
		mov ah, 40h
		mov bx, handle
		mov cx, numBytes
		lea dx, buffer
		int 21h
		jc ErrorEscribir
	endm
	
	cerrarF macro Handle
    	mov ah,3eh
    	mov bx,handle
    	int 21h
    	jc ErrorCerrar
	endm
;=========================== Fin Ficheros ================================

;=========================== Ini Tratamiento Texto =======================
	sizeCadena macro cadena
        push offset cadena              ;Enviamos parameter1
    	call Str_length                 ;EAX = longitud de la cadena
	endm
;=========================== Ini Tratamiento Texto =======================

;=========================== Ini Extras ===================================

	obtenerRandom macro 
	
		call Random
	endm


	ValorRegistro macro 
		call ImprimeValor
		print valor
	endm

	obtenerHora macro
		call GetTime
	endm

	obtenerFecha macro
		call GetData
	endm
;=========================== Fin Extras ===================================


;=========================== Ini Juego ===================================

	play macro 
		call game
	endm

;=========================== Fin Juego ===================================