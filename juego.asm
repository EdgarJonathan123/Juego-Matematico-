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
            read  NamePlayer
            call verificaRandom

            call CalcularValorRespuesta
            call RecorrerExpresion

            print pin 
            print PunteoFinal

            mov ax, NotaPlayer[0]
            ascii ax
            print Num


        
        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                ret         
            ;fin etiqueta
        ;fin Subrutna epilogo
    Game endp

    asignarNombre proc
        push ax

            mov ax,ptrPlayer[0]

            Elegir:
                cmp ax,1d
                je jugador1
                cmp ax,2d
                je jugador2
                cmp ax,3d
                je jugador3
                cmp ax,4d
                je jugador4
                cmp ax,5d
                je jugador5
                cmp ax,6d
                je jugador6
                cmp ax,7d
                je jugador7
                cmp ax,8d
                je jugador8
                cmp ax,9d
                je jugador9
                cmp ax,10d
                je jugador10

            ;fin
            
            




            jugador1:
                read Player1
                jmp FIN
            ;fin
            jugador2:
                read Player2
                jmp FIN
            ;fin
            jugador3:
                read Player3
                jmp FIN
            ;fin
            jugador4:
                read Player4
                jmp FIN
            ;fin
            jugador5:
                read Player5
                jmp FIN
            ;fin
            jugador6:
                read Player6
                jmp FIN
            ;fin
            jugador7:
                read Player7
                jmp FIN
            ;fin
            jugador8:
                read Player8
                jmp FIN
            ;fin
            jugador9:
                read Player9
                jmp FIN
            ;fin
            jugador10:
                read Player10
                jmp FIN
            ;fin

        
        FIN:
            pop ax
            ret
    asignarNombre endp

    asignarNota proc
            ; Recibe:       BX = Nota del Jugador
            ; Devuelve:     Nada
            ; Comentario:   Asigna la nota al jugador
           push ax

            mov ax,ptrPlayer[0]

            Elegir:
                cmp ax,1d
                je jugador1
                cmp ax,2d
                je jugador2
                cmp ax,3d
                je jugador3
                cmp ax,4d
                je jugador4
                cmp ax,5d
                je jugador5
                cmp ax,6d
                je jugador6
                cmp ax,7d
                je jugador7
                cmp ax,8d
                je jugador8
                cmp ax,9d
                je jugador9
                cmp ax,10d
                je jugador10

            ;fin


            jugador1:
                mov Nota1[0],bx
                jmp FIN
            ;fin
            jugador2:
                mov Nota2[0],bx
                jmp FIN
            ;fin
            jugador3:
                mov Nota3[0],bx
                jmp FIN
            ;fin
            jugador4:
                mov Nota4[0],bx
                jmp FIN
            ;fin
            jugador5:
                mov Nota5[0],bx
                jmp FIN
            ;fin
            jugador6:
                mov Nota6[0],bx
                jmp FIN
            ;fin
            jugador7:
                mov Nota7[0],bx
                jmp FIN
            ;fin
            jugador8:
                mov Nota8[0],bx
                jmp FIN
            ;fin
            jugador9:
                mov Nota9[0],bx
                jmp FIN
            ;fin
            jugador10:
                mov Nota10[0],bx
                jmp FIN
            ;fin

        
        FIN:
            pop ax
            ret
    asignarNota endp

    getNota proc
            ; Recibe:       puntero al jugador
            ; Devuelve:     BX = Nota Actual del Jugador
            ; Comentario:   Asigna la nota al jugador
           push ax

            mov ax,ptrPlayer[0]

            Elegir:
                cmp ax,1d
                je jugador1
                cmp ax,2d
                je jugador2
                cmp ax,3d
                je jugador3
                cmp ax,4d
                je jugador4
                cmp ax,5d
                je jugador5
                cmp ax,6d
                je jugador6
                cmp ax,7d
                je jugador7
                cmp ax,8d
                je jugador8
                cmp ax,9d
                je jugador9
                cmp ax,10d
                je jugador10

            ;fin


            jugador1:
                mov bx,Nota1[0]
                jmp FIN
            ;fin
            jugador2:
                mov bx,Nota2[0]
                jmp FIN
            ;fin
            jugador3:
                mov bx,Nota3[0]
                jmp FIN
            ;fin
            jugador4:
                mov bx,Nota4[0]
                jmp FIN
            ;fin
            jugador5:
                mov bx,Nota5[0]
                jmp FIN
            ;fin
            jugador6:
                mov bx,Nota6[0]
                jmp FIN
            ;fin
            jugador7:
                mov bx,Nota7[0]
                jmp FIN
            ;fin
            jugador8:
                mov bx,Nota8[0]
                jmp FIN
            ;fin
            jugador9:
                mov bx,Nota9[0]
                jmp FIN
            ;fin
            jugador10:
                mov bx,Nota10[0]
                jmp FIN
            ;fin

        
        FIN:
            pop ax
            ret
    getNota endp

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

    CalcularValorRespuesta proc
        ;--------------------------------------------------------------------
        ;   Recibe:      Nada                                              
        ;                                                                    
        ;   Devuelve:    BX = Numero de Expresiones     
        ;                                                                    
        ;   Comentarios: Calcula el valor de cada resppuesta en la expresion               
        ;--------------------------------------------------------------------

        ;ini Subrutina proglogo
            push si
            push di
        ;fin Subrutina prologo

        ;Ini Codigo--
            xor di,di
            xor si,si
            mov di,offset expresion             ;obtenemos la direccion Inicial de expresion
            jmp Bucle

            Bucle:
                mov al,[di]
                cmp al,0d                       ;¿Es fin de cadena?
                je Puntaje

                call getDato

                cmp ax,2                        ;¿Lesite Un Operador? 
                je Operadorr

                jmp Bucle
            ;Fin etiqueta

            Operadorr:
                inc si
                jmp bucle
            ;fin

            Puntaje:
                mov NumeroOperaciones[0],si

                mov dx,0d
                mov ax,100
                mov bx,si
                div bx  

                mov PunteoPorOperacion[0],ax           ;puntaje = 100/Numero de operaciones

                jmp FIN
            ;fin
         

        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                pop di
                pop si
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo
    CalcularValorRespuesta endp


    RecorrerExpresion proc

        ;--------------------------------------------------------------------
        ;   Recibe:      Nada                                              
        ;                                                                    
        ;   Devuelve:    Nada     
        ;                                                                    
        ;   Comentarios: Recorre la expresion y va bajando de precedencia                
        ;--------------------------------------------------------------------

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            sub  sp,2                  ;se guarda espacio para dos variables
            pusha
        ;fin Subrutina prologo

        ;Ini Codigo--
            limpiarCadena lexema
            mov word ptr[bp-2],4d                ;var local  = 0
            
    
            bucle:
                mov di,word ptr[bp-2]               ;precedencia mayor
                evaluar di 
                cmp ax,0            ;no existe ninguan operador con esa precedencia
                je decrementar

                
                jmp bucle 
            ;fin

            decrementar:

                mov di,word ptr[bp-2]
                dec di
                mov word ptr[bp-2],di
                cmp di,0            ;llegamosa precedencia 0?
                je FIN

                jmp bucle
            ;fin

        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                popa
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo
    RecorrerExpresion endp


    evaluarExpr proc
        ;----------------------------------------------------------------------;
        ;   Recibe:      [bp+4] Precedencia Actual                             ;
        ;                                                                      ;
        ;   Devuelve:    AX =0 No se Ejecuto Operador                          ;
        ;                AX =1 Si Se Ejecuto Operdor                           ; 
        ;                                                                      ;
        ;   Comentarios: Evalua la Expresion Escojida                          ;
        ;----------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            sub  sp,10                  ;se guarda espacio para dos variables
            push bx
            push di
            xor di,di
        ;fin Subrutina prologo

        ;Ini Codigo--
            limpiarCadena lexema
            mov word ptr[bp-2],0                ;var Cont  = 0
            mov word ptr[bp-4],0                ;var temp1  = 0
            mov word ptr[bp-6],0                ;var temp2  = 0
            mov word ptr[bp-8],0                ;var Result = 0
            mov word ptr[bp-10],0               ;convert = 0


            mov di,offset expresion             ;obtenemos la direccion Inicial de expresion
            jmp Bucle

            
            Bucle:
                mov ax, word ptr[bp-2]          ;cont = ax
                cmp ax,1d                       ;¿Ya hizo una operacion?
                je agregar

                mov al,[di]
                cmp al,0d                       ;¿Es fin de cadena?
                je FIN

                call getDato

                cmp ax,1                        ;¿Leiste Un Operando?
                je Operando1   

                cmp ax,2                        ;¿Lesite Un Operador? 
                je Operadorr

                jmp Bucle
            ;Fin etiqueta

            Operadorr:
                limpiarCadena LastOp
                copiarCadena aux,LastOp

                call getPrecedence
                mov bx,[bp+4]                   ;precedencia actual
                cmp ax,bx                       ;el Operador Coincide Con la Precedencia
                je Operando2


                mov bx,word ptr[bp-4]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                Concatenar Num,lexema 
                Concatenar aux,lexema

                push di
                    call getDato
                    mov al,[di]
                    cmp al,0d                       ;¿Es fin de cadena?
                    je conca
                    jmp afuera

                    conca:
                        Concatenar aux,lexema
                    ;fin

                    afuera:
                    ;fin
                pop di

                ;print corA
                ;print lexema
                ;println corC

                ;limpiarCadena aux
                jmp Bucle
            ;Fin

            Operando1:
                ADecimal aux
                mov word ptr[bp-4],ax           ;temp1=operando1
        
                jmp Bucle
            ;fin

            Operando2:

                mov bx,[bp+4]                   ;precedencia actual
                cmp bx,4d                       ;Es un factorial?
                je factoriall      

                call getDato                    ;leemos el operando2
                ADecimal aux                    ;lo Convertimos a decimal
                mov word ptr[bp-6],ax           ;temp2=operando2

                mov bx,word ptr[bp-2]           ;cont=bx
                inc bx                          ;aumentamos una oprecion con el operador
                mov word ptr[bp-2],bx           ;cont++

                jmp Operacion
            ;Fin

            Operacion:

                compararCadena LastOp,potencia
                je Elevar

                cmp LastOp[0],'+'
                je Suma

                cmp LastOp[0],'-'
                je Resta

                cmp LastOp[0],'*'
                je Multiplicacion

                cmp LastOp[0],'/'
                je Division               

                cmp LastOp[0],'%'
                je Modulo     
                
                jmp FIN
            ;Fin

            factoriall:

                mov bx,word ptr[bp-2]           ;cont=bx
                inc bx                          ;aumentamos una oprecion con el operador
                mov word ptr[bp-2],bx           ;cont++


                mov ax,word ptr[bp-4]           ;temp1 =ax 
                CalculaFactorial ax
 
                mov word ptr[bp-8],ax           ;resutl = temp1!
                Ascii ax
                Concatenar Num,lexema  


                print pin
                mov ax,word ptr[bp-4]           ;temp1=bx
                Ascii ax                        ;temp1 se paso a ascii
                print Num

                print LastOp

                print interrogacion
                print pin

                jmp Respuesta

                ;jmp Bucle
            ;fin

            Suma:
                mov ax,word ptr[bp-4]           ;temp1 =ax
                mov bx,word ptr[bp-6]           ;temp2 =bx     
                add ax,bx                       ;ax=ax+bx
                mov word ptr[bp-8],ax           ;resutl = temp1+temp2
                Ascii ax
                Concatenar Num,lexema  


                print pin
                mov bx,word ptr[bp-4]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num

                print LastOp

                mov bx,word ptr[bp-6]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num
                print interrogacion
                print pin

                jmp Respuesta

                ;jmp Bucle
            ;fin

            Resta:
                mov ax,word ptr[bp-4]           ;temp1 =ax
                mov bx,word ptr[bp-6]           ;temp2 =bx     
                sub ax,bx                       ;ax=ax+bx
                mov word ptr[bp-8],ax           ;resutl = temp1+temp2
                Ascii ax
                Concatenar Num,lexema  

                print pin
                mov bx,word ptr[bp-4]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num

                print LastOp

                mov bx,word ptr[bp-6]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num
                print interrogacion
                print pin 

                jmp Respuesta


                ;jmp Bucle
            ;fin

            Multiplicacion:

                mov ax,word ptr[bp-4]           ;temp1 =ax
                mov bx,word ptr[bp-6]           ;temp2 =bx   
                mul bx  
                mov word ptr[bp-8],ax           ;resutl = temp1*temp2
                Ascii ax
                Concatenar Num,lexema  
               


                print pin
                mov bx,word ptr[bp-4]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num

                print LastOp

                mov bx,word ptr[bp-6]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num
                print interrogacion
                print pin

                jmp Respuesta


                ;jmp Bucle
            ;fin

            Division:
                mov dx,0d
                mov ax,word ptr[bp-4]           ;temp1 =ax
                mov bx,word ptr[bp-6]           ;temp2 =bx   
                div bx  
                mov word ptr[bp-8],ax           ;resutl = temp1/stemp2
                Ascii ax
                Concatenar Num,lexema  


                print pin
                mov bx,word ptr[bp-4]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num

                print LastOp

                mov bx,word ptr[bp-6]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num
                print interrogacion
                print pin

                jmp Respuesta


                ;jmp Bucle
            ;fin

            Modulo:
                mov dx,0d
                mov ax,word ptr[bp-4]           ;temp1 =ax
                mov bx,word ptr[bp-6]           ;temp2 =bx   
                div bx  

                mov ax,dx
                mov word ptr[bp-8],ax           ;resutl = temp1/stemp2
                Ascii ax
                Concatenar Num,lexema  


                print pin
                mov bx,word ptr[bp-4]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num

                print LastOp

                mov bx,word ptr[bp-6]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num
                print interrogacion
                print pin

                jmp Respuesta


                ;jmp Bucle
            ;fin

            Elevar:

                mov ax,1
                mov cx,word ptr[bp-4]           ;cx = temp1
                mov bx,1                        ;dx = 1

                ele:
                    mov dx,word ptr[bp-6]        ;temp2 =bx  
                    cmp bx,dx                   ;¿bx > dx?
                    ja fuera

                    mul cx                      ;ax=ax*cx
                    inc bx

                    jmp ele
                ;FIN 


                fuera:
                    mov word ptr[bp-8],ax           ;resutl = temp1^temp2
                    Ascii ax
                    Concatenar Num,lexema  
                ;fin


                print pin
                mov bx,word ptr[bp-4]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num

                print LastOp

                mov bx,word ptr[bp-6]           ;temp1=bx
                Ascii bx                        ;temp1 se paso a ascii
                print Num
                print interrogacion
                print pin

                jmp Respuesta

                ;jmp Bucle
            ;fin

            Agregar:
                Concatenar1 di,lexema
                jmp FIN
            ;Fin

            Respuesta:
                read Result
                ADecimal Result
                mov bx,word ptr[bp-8]
                cmp ax,bx
                je Correcta

                jmp Incorrecta
            ;Fin

            Correcta:
                print pin
                print ok
                print mas
                mov ax,PunteoPorOperacion[0]
                ascii ax
                print Num
                print puntos

                mov ax,NotaPlayer[0]
                mov bx,PunteoPorOperacion[0]
                add ax,bx
                ;printReg ax
                mov NotaPlayer[0],ax

                jmp bucle
            ;fin

            Incorrecta:

                print pin
                print nook
                print mas
                print cero 
                print puntos
                print pin
                print respues
                mov bx,word ptr[bp-8]
                Ascii bx
                print Num
                

                jmp bucle
            ;fin
        

        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                limpiarCadena expresion
                copiarCadena lexema,expresion
                ;print corA
                ;print lexema
                ;println corC
                mov ax,word ptr[bp-2]          ;cont= ax
                pop di
                pop  bx
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 2
            ;fin etiqueta
        ;fin Subrutna epilogo
    evaluarExpr endp


    getDato proc
        ;----------------------------------------------------------------------;
        ;   Recibe:      Di apuntador                                          ;
        ;                                                                      ;
        ;   Devuelve:    Aux(Variable Global),AX=Tipo de Dato                  ;
        ;                                                                      ;
        ;   Comentarios: Concatena el el numero en la variable lexema          ;
        ;                AX=1 Numero                                           ;
        ;                AX=2 Operador                                         ;
        ;----------------------------------------------------------------------;
        push si
        xor si,si
        dec di
        limpiarCadena aux

        ;Ini Codigo--

            S0:
                inc di

                Blanco di                       ;¿Es un blanco?
                cmp bx,1
                je S0

                Numero di  
                cmp bx,1                        ;¿es un numero?    
                je S1       

                Operador di
                cmp bx,1                        ;¿Es un operador?
                je S2

                Fac di 
                cmp bx,1                        ;¿Es un Factorial?
                je S4

                jmp FIN
            ;fin

            S1:
                mov al,byte ptr[di]
                mov aux[si],al

                inc di
                inc si

                Numero di
                cmp bx,1                        ;¿es un numero?
                je S1

                jmp Numeroo
            ;fin

            S2:
                mov al,byte ptr[di]
                mov aux[si],al

                inc di
                inc si

                Operador di
                cmp bx,1                        ;¿Es un operador?
                je S3

                jmp Operadorr
            ;fin 

            S3:
                mov al,byte ptr[di]
                mov aux[si],al

                inc di
                inc si

                jmp Elevacion
            ;fin

            S4:
                ;print texto
                mov al,byte ptr[di]
                mov aux[si],al

                inc di
                inc si

                jmp Factoriall
            ;fin

            Numeroo:
                mov ax,1                    ;Numero
                jmp FIN
            ;fin
            
            Elevacion:
                mov al,aux[0]
                mov VOperador[0],al
                mov al,aux[1]
                mov VOperador[1],al
                mov ax,2                    ;Operador
                jmp FIN
            ;Fin

            Operadorr:
                mov al,aux[0]
                mov VOperador[0],'0'
                mov VOperador[1],al
                mov ax,2                    ;Operador
                jmp FIN
            ;Fin

            Factoriall:
                mov al,aux[0]
                mov VOperador[0],'0'
                mov VOperador[1],al
                mov ax,2                    ;Operador
                jmp FIN
            ;Fin
        
        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN: 
                pop si
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo
    getDato endp

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
                je Elevar
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

            Elevar:
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


    calcFac proc 
        ;--------------------------------------------------------------------;
        ;   Recibe:      [bp+4]= Operando Factorial                          ;
        ;                                                                    ;
        ;   Devuelve:    AX = Resultado Factorial                            ;
        ;                                                                    ;
        ;   Comentarios: Devuelve el Factorial de un Numero                  ;
        ;--------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            sub  sp,2                  ;se guarda espacio para dos variables
            push di
            push bx
            push cx
        ;fin Subrutina prologo

        ;Ini Codigo--
            mov word ptr[bp-2],1                ;var local  = 0

            mov cx,word ptr[bp+4]               ;valor del factorial
            mov ax,1
            mov bx,1

            Bucle:
                mov bx,word ptr[bp-2]
                cmp bx,cx       ; ¿bx > cx?
                ja Fin

                mul bx

                mov bx,word ptr[bp-2]
                inc bx
                mov word ptr[bp-2],bx

                jmp Bucle
            ;fin


        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:

                pop cx
                pop bx
                pop di
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 2 
            ;fin etiqueta
        ;fin Subrutna epilogo    
    calcFac endp
; Factorial proc
;     ;--------------------------------------------------------------------;
;     ;   Recibe:      [bp+4] Numero n                                     ;
;     ;                                                                    ;
;     ;   Devuelve:    AX=factorial de n                                   ;
;     ;                                                                    ;
;     ;   Comentarios: Calcula el factorial de un numero                   ;
;     ;--------------------------------------------------------------------;
;
;     ;ini Subrutina proglogo
;         push bp                    ;almacenamos el puntero base
;         mov  bp,sp                 ;ebp contiene la direccion de esp
;        
;     ;fin Subrutina prologo
;
;     ;Ini Codigo--
;         mov ax,[bp+4]                   ;obtiene n
;         cmp ax,0                        ;n>0?
;         ja L1                           ;si: continua
;         mov ax,1                        ;no: regresa un 1
;         jmp FIN
;
;         L1:
;             print nada
;             dec ax
;             push ax                         ;factorial(n-1)
;             call Factorial
;             ;-------------------
;             ;las instrucciones de aqui en adelante se ejecutan cuando
;             ;regressa cada una de las llamadas recursivas
;             ;--------------------
;             mov bx,[bp+4]                   ;obtiene n
;             mul bx                          ;dx: ax = ax*bx
;         ;fin
;     ;Fin Codigo--
;
;     ;ini Subrutina epilogo
;         FIN:
;             pop bp                  ;restaura el valor del puntro base listo para el ret
;             ret 2
;         ;fin etiqueta
;     ;fin Subrutna epilogo
;
; Factorial endp

;================== Fin Operaciones ============================