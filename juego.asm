;================== Ini Juego ==================================

    Game proc
        ;--------------------------------------------------------------------
        ;   Recibe:      Nada                                              
        ;                                                                    
        ;   Devuelve:    Nada     
        ;                                                                    
        ;   Comentarios: Maneja todo el funcionamiento del juego                  
        ;--------------------------------------------------------------------


        ;ini Subrutina proglogo
        ;fin Subrutina prologo

        ;Ini Codigo--

            ;obtenerRandom 8d 
            ;print tab
            ;printReg ax

            print nombre
            read NamePlayer
            call verificaRandom
            getchar

        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                ret         
            ;fin etiqueta
        ;fin Subrutna epilogo
    Game endp

    verificaRandom proc

        ;--------------------------------------------------------------------
        ;   Recibe:      nada                                               
        ;                                                                   
        ;   Devuelve:    Nada     
        ;                                                                    
        ;   Comentarios: Usa ramdon o no dependiendo lo ingresado por el usuario                  
        ;--------------------------------------------------------------------


        ;ini Subrutina proglogo
            push ax
            push di
        ;fin Subrutina prologo

        ;Ini Codigo--
            
   
            PedirAleatorio:
                print aleatorio
                getchar
                cmp al,89d   ;Y
                je yes
                cmp al,121d  ;y
                je yes
                cmp al,78d   ;N
                je NO
                cmp al,110d  ;n
                je NO
                print inInvalida
                jmp PedirAleatorio
            ;fin etiqueta

            yes:
                mov ax, ptrExpr[0]
                obtenerRandom ax
                call getExpresion
                print pin
                print expresion
                
                jmp FIN
            ;fin etiqueta

            NO:
               print noOperacion 
               read tamanioExp
               mov ax,tamanioExp[0]
               sub ax,49

               call getExpresion
               print pin
               print expresion
               
               jmp FIN
            ;fin etiqueta




        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                pop di
                pop ax
                ret         
            ;fin etiqueta
        ;fin Subrutna epilogo
    verificaRandom endp

    getExpresion proc

        limpiarCadena expresion
        cmp ax,0d
        je EXPRESION0
        cmp ax,1d
        je EXPRESION1
        cmp ax,2d
        je EXPRESION2
        cmp ax,3d
        je EXPRESION3
        cmp ax,4d
        je EXPRESION4
        cmp ax,5d
        je EXPRESION5
        cmp ax,6d
        je EXPRESION6
        cmp ax,7d
        je EXPRESION7
        cmp ax,8d
        je EXPRESION8
        cmp ax,9d
        je EXPRESION9

        ;Ini Exprsiones
            EXPRESION0:
                copiarCadena expr0,expresion
                jmp FIN
            ;fin
            EXPRESION1:
                copiarCadena expr1,expresion
                jmp FIN
            ;fin
            EXPRESION2:
                copiarCadena expr2,expresion
                jmp FIN
            ;fin
            EXPRESION3:
                copiarCadena expr3,expresion
                jmp FIN
            ;fin
            EXPRESION4:
                copiarCadena expr4,expresion
                jmp FIN
            ;fin
            EXPRESION5:
                copiarCadena expr5,expresion
                jmp FIN
            ;fin
            EXPRESION6:
                copiarCadena expr6,expresion
                jmp FIN
            ;fin
            EXPRESION7:
                copiarCadena expr7,expresion
                jmp FIN
            ;fin
            EXPRESION8:
                copiarCadena expr8,expresion
                jmp FIN
            ;fin
            EXPRESION9:
                copiarCadena expr9,expresion
                
            ;fin
        ;Fin Expresiones

        FIN:
            ret
    getExpresion endp
   
;================== Fin Juego ==================================

;================== Ini Operaciones ============================



    getPrecedence proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      VOperador(Variable Global) = Operador               ;
        ;                                                                    ;
        ;   Devuelve:    AX = Numero de precedencia                          ;
        ;                                                                    ;
        ;   Comentarios: Devuelve un numero de precedencia del operador      ;
        ;                  AX= 4 ->Factorial                                 ;
        ;                  AX= 3 ->potencia                                  ;
        ;                  AX= 2 ->multi,resto,division                      ;
        ;                  AX= 1 ->suma,resta                                ;
        ;--------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
        ;fin Subrutina prologo


        ;Ini Codigo--

            pos0:
                mov al,VOperador[0]
                cmp al,'0'                  ;si es un cero en ascii
                je pos1

                cmp al,'*'
                je potencia
            ;fin
            pos1:

                mov al,VOperador[1]

                cmp al,33d                      ;al =!
                je Factorial

                cmp al,42d                      ;al =*
                je multiplicacion
                cmp al,37d                      ;al =%
                je multiplicacion
                cmp al,47d                      ;al =/
                je multiplicacion


                cmp al,43d                      ;al =+
                je suma
                cmp al,45d                      ;al =-
                je suma

            ;fin
            

            Factorial:
                mov ax,4d
                jmp FIN
            ;fin

            potencia:
                mov ax,3d
                jmp FIN
            ;fin

            multiplicacion:
                mov ax,2d
                jmp FIN
            ;fin

            suma:
                mov ax,1d
                jmp FIN
            ;fin

        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo

    
    getPrecedence endp


    getNumber proc
        ;----------------------------------------------------------------------;
        ;   Recibe:      Di apuntador                                          ;
        ;                                                                      ;
        ;   Devuelve:    Lexema(Variable Global)                               ;
        ;                                                                      ;
        ;   Comentarios: Concatena el el numero en la variable lexema          ;
        ;----------------------------------------------------------------------;
        push si
        push ax
        xor si,si
        limpiarCadena aux

        ;Ini Codigo--

            S0:
                Numero di  
                cmp bx,1                        ;¿es un numero?    
                je S1       
            ;fin

            S1:
                mov al,byte ptr[di]
                mov aux[si],al

                inc di
                inc si

                Numero di
                cmp bx,1                        ;¿es un numero?
                je S1

                jmp S2
            ;fin

            S2:
                mov al,byte ptr[di]
                mov aux[si],al

                inc di
                inc si

                mov aux[si],'$'

                jmp FIN
            ;FIN
        
        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN: 
                pop ax
                pop si
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo
    getNumber endp

    toPosfija proc
        ;--------------------------------------------------------------------
        ;   Recibe:       expresion (variable global)                       
        ;                                                                    
        ;   Devuelve:     expresion
        ;                                       
        ;                                                                            
        ;   Comentarios: convierte la expresiond e infija a postfija
        ;--------------------------------------------------------------------

        ;Ini Subrutina proglogo
            push bp                     ;almacenamos el puntero base
            mov  bp,sp                  ;ebp contiene la direccion de esp
            push si 
            push ax
            mov di,offset expresion       ;di = apuntador del caracter
            dec di  
        ;Fin Subrutina proglogo

        ;Ini Codigo--
            limpiarCadena lexema                ;limipiamos el contenido el token 
            xor si,si
            xor ax,ax
                  
     

        ;Fin Codigo--

        ;Ini Subrutina epilogo
            FIN:
                pop ax
                pop si
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 2 
            ;fin etiqueta  
        ;Fin Subrutina epilogo  
    toPosfija endp


    Factorial proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      [bp+4] Numero n                                     ;
        ;                                                                    ;
        ;   Devuelve:    AX=factorial de n                                   ;
        ;                                                                    ;
        ;   Comentarios: Calcula el factorial de un numero                   ;
        ;--------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
        ;fin Subrutina prologo

        ;Ini Codigo--
            mov ax,[bp+4]                   ;obtiene n
            cmp ax,0                        ;n>0?
            ja L1                           ;si: continua
            mov ax,1                        ;no: regresa un 1
            jmp FIN

            L1:
                dec ax
                push ax                         ;factorial(n-1)
                call Factorial
                ;-------------------
                ;las instrucciones de aqui en adelante se ejecutan cuando
                ;regressa cada una de las llamadas recursivas
                ;--------------------
                mov bx,[bp+4]                   ;obtiene n
                mul bx                          ;dx: ax = ax*bx
            ;fin
        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 2
            ;fin etiqueta
        ;fin Subrutna epilogo

    Factorial endp

;================== Fin Operaciones ============================