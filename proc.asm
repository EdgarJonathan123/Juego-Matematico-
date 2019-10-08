;================== Ini String =================================
    ReadString proc
        ;---------------------------------------------------------------;
        ;   Recibe:     DS:DX apunta al bufer de entrada,              ;
        ;               CX= maximo de caracteres de entrada.            ;
        ;                                                               ;
        ;   Devuelve:   AX= tamana de la cadena de entrada.             ;
        ;                                                               ;
        ;   Comentarios:Se detiene cuando se oprime Intro(0dh),         ;
        ;               o cuando se leen (CX-1) caracateres.            ;
        ;---------------------------------------------------------------;

        push cx                     ;guarda los registros
        push si
        push cx                     ;guarda la cuenta de digitos otra vez
        mov si,dx                   ;apunta al buffer de entrada
        dec cx                      ;guarda el spacio para el byte nulo

        L1:
            mov ah,1                ;funcionn de entrada del teclado
            int 21h                 ;DOS devuelve el caracter en AL
            cmp al,0dh              ;¿fin de linea?
            je L2                   ;si: termina
            mov [si],al             ;no: guarda el caracter
            inc si                  ;incrementa el apuntador al bufer
            loop L1                 ;itera hasta CX = 0

        L2:
            mov byte ptr[si],0      ;termina con un byte nulo
            pop ax                  ;cuenta de digitos original
            sub ax,cx               ;AX= tamanio de la cadena de entrada
            dec ax
            pop si                  ;restaura los registros
            pop cx

        ret
    ReadString endp

    Str_length proc
        ;--------------------------------------------------------------------;
        ;   Recibe:     DS:[bp+4] apunta al arreglo                          ;
        ;                                                                    ;
        ;   Devuelve:   AX= tamanio de la cadena de entrada.                 ;
        ;                                                                    ;
        ;   Comentarios:Se detiene cuando se encuentra (0dh)en el arreglo.   ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push di                    ;guarda edi para no perder el valor al salir

        ;Ini Codigo--
            mov di,[bp+4]    ;guarda Parametro1 en edi
            xor ax,ax                 ;eax=0

            L1:
                cmp byte PTR[di],0      ;¿final de cadena?
                je  L2                  ;si: termina
                inc di                  ;no: apunta al siguiente
                inc ax                  ;suma 1 a la cuenta
                jmp L1

        ;Fin Codigo--

        L2:
            ;Subrutina epilogo
            pop di                  ;obtenemos el valor devuelta
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2
    Str_length endp

    WriteString proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:DX apunta a la cadena                            ;
        ;                                                                    ;
        ;   Devuelve:    Nada.                                               ;
        ;                                                                    ;
        ;   Comentarios: Recibe una cadena con terminacion nula y            ;
        ;                lo imprime en la salida estandar                    ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        pusha
        push ds                         ;ES=DS
        pop  es

        ;Ini Codigo--
            push dx                         ;Enviamos parameter1
            call Str_length                 ;EAX = longitud de la cadena
            mov cx,ax                       ;ECX = numero de bytes
            mov ah,40h                      ;Escribe al archivo o dispositivo
            mov bx,1                        ;manejador de salida estandar
            int 21h                         ;llamada a ms-dos
        ;Fin Codigo--

        ;Subrutina epilogo
        popa
        ret
    WriteString endp

    Copy_String proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+8]  inicio token1                            ;
        ;                DS:[bp+6]  fin token1                               ;
        ;                DS:[bp+4]  inicio token2                            ;
        ;                                                                    ;
        ;   Devuelve:    Solo afecta las cadenas enviadas                    ;
        ;                                                                    ;
        ;   Comentarios: Copia token1 a token2                               ;
        ;--------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            pusha                      ;guarda los registros multiproposito
            mov di,[bp+8]              ;di = direccion inicio token1
            mov si,[bp+4]              ;si = direccion inicio token2
            mov cx,[bp+6]              ;cx = direccion fin    token2
            inc cx
            jmp COPIA
        ;fin Surutina prologo

        ;Ini Codigo--
            COPIA:
                cmp cx,di               ;¿El iterador == tamanio+1?
                je FIN                  ;si: termina la copia

                mov al,byte ptr[di]
                mov byte ptr[si],al

                inc di
                inc si
                jmp COPIA
            ;fn etiqueta

        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                popa                    ;obtenemos el valor devuelta
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 6
            ;fin etiqueta
        ;fin Subrutina epilogo

    Copy_String endp

    Clear_String proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] cadena                                    ;
        ;                                                                    ;
        ;   Devuelve:    nada                                                ;
        ;                                                                    ;
        ;   Comentarios: Limpia la cadena dada.                              ;
        ;--------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            push di                    ;guardamos di porque se utilizara
            push ax                    ;guardamos ax porque se utilizara
        ;fin Subrutina prologo

        ;Ini Codigo--
            mov di,[bp+4]             ;guarda Parametro1 en di
            xor ax,ax                 ;ax=0

            L1:
                cmp byte PTR[di],0      ;¿final de cadena?
                je  FIN                 ;si: termina
                inc di                  ;no: apunta al siguiente
                mov byte ptr[di],0      ;suma 1 a la cuenta
                jmp L1
            ;fin etiqueta

        ;Fin Codigo--


        ;ini Subrutina epilogo
            FIN:
                pop ax                  ;obtenemos ax despues de su uso
                pop di                  ;obtenemos di despues de su uso
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 2
            ;fin etiqueta
        ;fin Subrutna epilogo

    Clear_String endp

    toAscii proc
        ;--------------------------------------------------------------------
        ;   Recibe:      AX = Numero decimal                                                
        ;                                                                    
        ;   Devuelve:    Num = llena a num con el numero     
        ;                                                                    
        ;   Comentarios: Separa el numero en digitos y pone  lso digitos en un arreglo                    
        ;--------------------------------------------------------------------

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            sub  sp,2                  ;se guarda espacio para dos variables
            mov word ptr[bp-2],0       ;var local =0 
            pusha
        ;fin Subrutina prologo

        ;Ini Codigo--
            push offset Num                    ;enviando un parametro
            call Clear_String                  ;limpiamos el arreglo
            xor si,si                          ;si=0


            mov  bx,0d                    ;denota el fin de la cadena
            push bx                       ;se pone en la pila el fin de cadena
            


            Bucle:  
                cmp ax,0                    ;¿AX= 0?
                je toNum                    ;si:enviar numero al arreglo
                
                mov bl,10                   ;divisor  = 10
                div bl                      ;al=cociente, ah= residuo


                add ah,48                   ;residuo +48 para  poner el numero en ascii
                mov byte ptr[bp-2],ah       ;pasamos el ascii a un registro de 16 bits
                mov bx, word ptr[bp-2]      

                push bx                     ;lo metemos en la pila 
                mov ah,0                    ;limpiamos la parte alta de ax

                jmp Bucle
            ;fin etiqueta


            toNum:
                pop bx                      ;obtenemos elemento de la pila
                mov word ptr[bp-2],bx       ; pasamos de 16 bits a 8 bits 
                mov al, byte ptr[bp-2]


                cmp al,0                    ;¿Fin de Numero?
                je FIN                      ;si: enviar al fin de l procedimiento
                mov num[si],al              ;ponemos el numero en ascii en la cadena
                inc si                      ;incrementamos los valores               
                jmp toNum                   ;iteramos de nuevo 

            ;fin etiqueta



        ;Fin Codigo--

        ;ini Subrutina epilogo
            FIN:
                popa
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo

    toAscii endp


;================== Fin String =================================

;================== Ini Extras =================================
    PrintAl proc
        push ax
        push dx

        mov ah,02h
    	mov dl,al
    	int 21h

        pop dx
        pop ax
    PrintAl endp

    GetTime proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      Nada                                                ;
        ;                                                                    ;
        ;   Devuelve:    CH = Horas(0-23)                                    ;
        ;                CL = Minutos(0-59)                                  ;
        ;                DH = Segundos(0-59)                                 ;
        ;                DL = Centesimas(No son precisas)                    ;
        ;                                                                    ;
        ;                                                                    ;
        ;   Comentarios: Obtiene la hora del sistema                         ;
        ;--------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            sub  sp,2                  ;se guarda espacio para dos variables
            mov word ptr[bp-2],0       ;var local =0
            pusha
        ;fin Subrutina prologo

        ;Ini Codigo--
            mov ah,2ch                  ;funcion de la hora
            int 21h                     ;llamada a ms-dos

            mov byte ptr[bp-2],ch       ;local=hora
            mov ax,word ptr[bp-2]       ;diviendo(hora)
            mov bl,10                   ;divisor
            div bl                      ;al=cociente(Decena), ah= residuo(Unidad)

            xor di,di                   ;di =0
            add al,48                   ;decenahora+48 para su valor en asccii
            mov hora[di+6],al           ;decena de la hora
            add ah,48                   ;unidadhora+48 para su valor en asccii
            mov hora[di+7],ah           ;unidad de la hora

            mov byte ptr[bp-2],cl       ;local=minutos
            mov ax,word ptr [bp-2]      ;diviendo(minutos)
            mov bl,10                   ;divisor
            div bl                      ;al=cociente(Decena), ah= residuo(Unidad)

            xor di,di                   ;di =0
            add al,48                   ;decenaminuto+48 para su valor en asccii
            mov hora[di+9],al           ;decena de los minutos
            add ah,48                   ;unidadminuto+48 para su valor en asccii
            mov hora[di+10],ah          ;unidad de la minutos

            mov byte ptr[bp-2],dh       ;local=segundos
            mov ax,word ptr [bp-2]      ;diviendo(minutos)
            mov bl,10                   ;divisor
            div bl                      ;al=cociente(Decena), ah= residuo(Unidad)

            xor di,di                   ;di =0
            add al,48                   ;decenaminuto+48 para su valor en asccii
            mov hora[di+12],al          ;decena de los minutos
            add ah,48                   ;unidadminuto+48 para su valor en asccii
            mov hora[di+13],ah          ;unidad de la minutos

        ;Fin Codigo--


        ;ini Subrutina epilogo
            FIN:
                popa
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo
    GetTime endp

    Random proc 
        ;--------------------------------------------------------------------
        ;   Recibe:      Nada                                                
        ;                                                                    
        ;   Devuelve:    AX = Numero ramdon del uno al diez         
        ;                                                                    
        ;   Comentarios: Obtiene la hora del sistema                         
        ;--------------------------------------------------------------------

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            sub  sp,2                  ;se guarda espacio para dos variables
            mov word ptr[bp-2],0       ;var local =0
            push dx
            push bx
        ;fin Subrutina prologo

        ;Ini Codigo--
            mov ah,2ch                  ;funcion de la hora
            int 21h                     ;llamada a ms-dos

            mov byte ptr[bp-2],dl       ;DL = Centesimas(No son precisas)    
            mov ax,word ptr[bp-2]       ;diviendo = Centesimas
            mov bl,10                   ;divisor  = 10
            div bl                      ;al=cociente, ah= residuo

            add bl,1                    ;mod %10 +1
            mov ah,0
            mov al,bl
        ;Fin Codigo--


        ;ini Subrutina epilogo
            FIN:
                push bx
                push dx 
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo
    Random endp

    GetData proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      Nada                                                ;
        ;                                                                    ;
        ;   Devuelve:    CX = Anio(0-2019)                                   ;
        ;                DH = mes(0-12)                                      ;
        ;                DL = dia(0-31)                                      ;
        ;                                                                    ;
        ;   Comentarios: Obtiene la fecha del sistema                        ;
        ;--------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            sub  sp,2                  ;se guarda espacio para dos variables
            mov word ptr[bp-2],0       ;var local =0
            pusha
        ;fin Subrutina prologo

        ;Ini Codigo--
            mov ah,2ah                  ;funcion obtener fecha del sistema
            int 21h                     ;llamada a ms-dos

            mov byte ptr[bp-2],dl       ;local=dia
            mov ax,word ptr[bp-2]       ;diviendo(dia)
            mov bl,10                   ;divisor
            div bl                      ;al=cociente(Decena), ah= residuo(Unidad)

            xor di,di                   ;di =0
            add al,48                   ;decenadia+48 para su valor en asccii
            mov fecha[di+8],al          ;decena de la hora
            add ah,48                   ;unidaddia+48 para su valor en asccii
            mov fecha[di+9],ah          ;unidad de la hora

            mov byte ptr[bp-2],dh       ;local=mes
            mov ax,word ptr [bp-2]      ;diviendo(minutos)
            mov bl,10                   ;divisor
            div bl                      ;al=cociente(Decena), ah= residuo(Unidad)

            xor di,di                   ;di =0
            add al,48                   ;decenaminuto+48 para su valor en asccii
            mov fecha[di+11],al         ;decena de los minutos
            add ah,48                   ;unidadminuto+48 para su valor en asccii
            mov fecha[di+12],ah         ;unidad de la minutos

        ;Fin Codigo--


        ;ini Subrutina epilogo
            FIN:
                popa
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 
            ;fin etiqueta
        ;fin Subrutna epilogo


    GetData endp

    ImprimeValor proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      al->valor                                           ;
        ;                                                                    ;
        ;   Devuelve:    nada                                                ;
        ;                                                                    ;
        ;   Comentarios: Imprime el valor de al en pantalla                  ;
        ;--------------------------------------------------------------------;

        ;ini Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            sub  sp,2                  ;se guarda espacio para dos variables
            mov word ptr[bp-2],0       ;var local =0
            pusha
        ;fin Subrutina prologo

        ;Ini Codigo--


            mov byte ptr[bp-2],al       ;local=al

            mov ax,word ptr[bp-2]       ;diviendo
            mov bl,10                   ;divisor
            div bl                      ;al=cociente, ah= residuo

            xor di,di                   ;di =0
            add ah,48
            mov valor[di+7],ah          ;unidad

            mov byte ptr[bp-2],al       ;local=al
            mov ax,word ptr [bp-2]      ;diviendo
            mov bl,10                   ;divisor
            div bl                      ;al=cociente, ah=residuo

            xor di,di                   ;di =0
            add ah,48
            mov valor[di+6],ah          ;decena
            add al,48
            mov valor[di+5],al          ;centena

        ;Fin Codigo--




        ;ini Subrutina epilogo
            FIN:
                popa
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret
            ;fin etiqueta
        ;fin Subrutna epilogo

    ImprimeValor endp


;================== Fin Extras =================================


;================== Ini Juego ==================================
    
    
    Game proc

        ;call Random
        mov ax,2000
        call toAscii
        print corA 
        print Num
        print corC


        mov ax,558
        call toAscii
        print corA 
        print Num
        print corC

        ret
    Game endp
;================== Fin Juego ==================================