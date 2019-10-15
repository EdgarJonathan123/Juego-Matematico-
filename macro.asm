;=========================== Ini Obtener Texto ===========================
 	print macro cadena 
	 	push dx
	    mov dx, offset cadena 
        call WriteString
		pop dx
    endm

 	sizeCadena macro cadena
        push offset cadena              ;Enviamos parameter1
    	call Str_length                 ;EAX = longitud de la cadena
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
		print corA
		call PrintAl
		println corC

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

	limpiarCadena macro cadena

		push offset cadena
		call Clear_String

	endm 

	Concatenar macro string1,string2
		push offset string2
		push offset string1
		call Append_String
	endm

	printReg macro parameter1
		push ax		
		mov ax,parameter1
	    call toAscii
		print corA
		print Num
		println corC
		pop ax
	endm

	copiarCadena macro string1,string2
		push offset string2
		push offset string1
		call Copy_String
	endm
	
	compararCadena macro string1,string2
		push offset string2
		push offset string1
        call Compare_String
	endm

	Aminuscula macro string
		push offset string
		call toLowerCase
	endm

	ADecimal macro parameter1
		push  offset parameter1
		call toDecimal
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

;=========================== Ini Extras ===================================

	obtenerRandom macro parameter1
		mov ax,parameter1
		push ax
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

;=========================== Fin ALex ====================================

	obtenerToken macro parameter1
		push parameter1
        call getToken
	endm


    Letra macro parameter1
		mov di, parameter1
        call EsLetra
	endm

    Numero macro parameter1
		mov di, parameter1
        call EsNumero
	endm
	
    Operador macro parameter1
		mov di, parameter1
        call EsOperador
	endm

    Blanco macro parameter1
		mov di, parameter1
        call EsBlanco
	endm

    Mayor macro parameter1
		mov di, parameter1
        call EsMayor
	endm

    Menor macro parameter1
		mov di, parameter1
        call EsMenor
	endm
	
    BarraInvertida macro parameter1
		mov di, parameter1
        call EsBarraInvertida
	endm

    PtoComa macro parameter1
		mov di, parameter1
        call EsPtoComa
	endm

	punto macro parameter1
		mov di, parameter1
        call EsPunto
	endm

    FinCad macro parameter1
		push parameter1
        call EsFin
	endm

	Fac macro parameter1
		push parameter1
		call EsFactorial
	endm

;=========================== Fin ALex ====================================