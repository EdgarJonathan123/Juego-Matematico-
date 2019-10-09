;=========================== Ini Obtener Texto ===========================
 	print macro cadena 
	 	push dx
	    mov dx, offset cadena 
        call WriteString
		pop dx
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

	limpiarCadena macro cadena

		push offset cadena
		call Clear_String

	endm 

	printReg macro parameter1
		mov ax,parameter1
	    call toAscii
		print Num
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

	obtenerRandom macro parameter1
		push bx
		mov bx, parameter1
		push bx

		call Random

		push bx
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

	llenarExpresiones macro
		mov expresiones[0],expr0[0]
		mov expresiones[1],expr1[0]
		mov expresiones[2],expr2[0]
		mov expresiones[3],expr3[0]
		mov expresiones[4],expr4[0]
		mov expresiones[5],expr5[0]
		mov expresiones[6],expr6[0]
		mov expresiones[7],expr7[0]
		mov expresiones[8],expr8[0]
		mov expresiones[9],expr9[0]
	endm


    Letra macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsLetra
		pop dx
	endm

    Numero macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsNumero
		pop dx
	endm
	
    Operador macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsOperador
		pop dx
	endm

    Blanco macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsBlanco
		pop dx
	endm

    Mayor macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsMayor
		pop dx
	endm

    Menor macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsMenor
		pop dx
	endm
	
    BarraInvertida macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsBarraInvertida
		pop dx
	endm

    PtoComa macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsPtoComa
		pop dx
	endm

	punto macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsPtoComa
		pop dx
	endm

    FinCad macro parameter1
		push dx
		mov dx,parameter1
		push dx
        call EsFin
		pop dx
	endm

;=========================== Fin ALex ====================================