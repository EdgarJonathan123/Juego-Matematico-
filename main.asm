main proc
    IniciarDs

    menuprincipal:
        println msm0
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
        print msm20
        jmp menuprincipal
    ;fin etiqueta
    
    Jugar:
        print msm21
        jmp menuprincipal
    ;rin etiqueta
    Top10:
        print msm22
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


main endp
