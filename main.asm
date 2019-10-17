main proc
    Inicio:
        IniciarDs

        crearReporteFinal
        contarElementos msm0
        escribirRFinal di, msm0
        obtenerHora
        contarElementos hora
        escribirRFinal di, hora
        obtenerFecha
        contarElementos fecha
        escribirRFinal di, fecha


        println msm0
        jmp menuprincipal
    ;fin etiqueta
    menuprincipal:
        println msm8
        print   tab
        getchar

        cmp al,31h  ;1
            je Cargar
        cmp al,32h  ;2
            je Jugar
        cmp al,33h  ;3
            je Top10
        cmp al,34h  ;4
            je Reportes
        cmp al,35h  ;5
            je SALIR
        jmp menuprincipal
    ;fin etiqueta
    Cargar:
        println msm20   
        ;read rutaArchivo
	    abrirF rutaArchivo, ptrfileLectura
		leerF ptrfileLectura, SIZEOF bufferLectura, bufferLectura
        cerrarF ptrfileLectura    

        call Analisis
        println space
        print msmsucces1

        getchar
        jmp menuprincipal
    ;fin etiqueta
    Jugar:
        
        mov ax,ptrPlayer[0]
        add ax,1d
        mov ptrPlayer[0],ax

        print msm21
        play


        ;Ini Escribio Reporte
            contarElementos salto
            escribirRFinal di, salto

            mov ax,ptrPlayer[0]
            ascii ax
            contarElementos Num
            escribirRFinal di, Num

            contarElementos space
            escribirRFinal di, space

            contarElementos NamePlayer
            escribirRFinal di, NamePlayer

            contarElementos space
            escribirRFinal di, space

            mov ax, NotaPlayer[0]
            ascii ax
            contarElementos Num
            escribirRFinal di, Num
        ;Fin Escribio Reporte


        getchar
        jmp menuprincipal
    ;rin etiqueta
    Top10:
        print msm22
        cerrarRFinal
        jmp menuprincipal
    ;fin etiqueta
    Reportes:
        print msm23
        jmp menuprincipal
    ;fin etiqueta


    ;==============================Errores======================================

        ErrorAbrir:
	        println msmError1
	        getChar
	        jmp menuprincipal
        ;fin etiqueta

        ErrorLeer:
	        println msmError2
	        getChar
	        jmp menuprincipal
        ;fin etiqueta

        ErrorCrear:
	        println msmError3
	        getChar
	        jmp menuprincipal
        ;fin etiqueta

	    ErrorEscribir:
	        println msmError4
	        getChar
	        jmp menuprincipal
        ;fin etiqueta

        ErrorCerrar:
	        println msmError5
	        getChar
	        jmp menuprincipal
        ;fin etiqueta
        
        salir:
            mov ah,4ch ; numero de funcion para finalizar el programa
            xor al,al
            int 21h
        ;fin etiqueta
      ;==============================Errores======================================
main endp
