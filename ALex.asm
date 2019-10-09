
;================== Ini Verificando Caracteres =========================
    EsLetra proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es letra                                 ;
        ;                BX = 1  es letra                                    ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si es letra o no      ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
            push bp                    ;almacenamos el puntero base
            mov  bp,sp                 ;ebp contiene la direccion de esp
            push ax
            mov al,byte ptr[bp+4]        ;al = caracter
            jmp VerificaMinuscula
        ;Fin Subrutina prologo

        ;Ini Codigo--
            VerificaMinuscula:
                cmp al,111d                 ;al=o
                je SiEsLetra    
                cmp al,112d                 ;al=p
                je SiEsLetra      
                cmp al,101d                 ;al=e
                je SiEsLetra      
                cmp al,114d                 ;al=r
                je SiEsLetra      
                cmp al,97d                  ;al=a
                je SiEsLetra      
                cmp al,99d                  ;al=c
                je SiEsLetra      
                cmp al,105d                 ;al=i
                je SiEsLetra      
                cmp al,110d                 ;al=n
                je SiEsLetra     
                cmp al,113d                 ;al=q
                je SiEsLetra      
                cmp al,117d                 ;al=u
                je SiEsLetra       
                jmp VerificaMayuscula       ;no: Verificamos si es mayuscula
            ;fin etiqueta  

            VerificaMayuscula:  
                cmp al,79d                  ;al=O
                je SiEsLetra    
                cmp al,80d                  ;al=P
                je SiEsLetra      
                cmp al,69d                  ;al=E
                je SiEsLetra      
                cmp al,82d                  ;al=R
                je SiEsLetra      
                cmp al,65d                  ;al=A
                je SiEsLetra      
                cmp al,67d                  ;al=C
                je SiEsLetra      
                cmp al,73d                  ;al=I
                je SiEsLetra      
                cmp al,78d                  ;al=N
                je SiEsLetra     
                cmp al,81d                  ;al=Q
                je SiEsLetra      
                cmp al,85d                  ;al=U 
                je SiEsLetra       
                jmp NoEsLetra               ;no: entonces no es una letra
            ;fin etiqueta

            NoEsLetra:
                mov bx,0                    ;devuelve 0
                jmp FIN
            ;fin etiqueta

            SiEsLetra:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
            FIN:
                pop ax
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 2 
            ;fin etiqueta   
        ;Surutina Epilogo 
    EsLetra endp

    EsNumero proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es numero                                ;
        ;                BX = 1  es numero                                   ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si es letra o no      ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verificaNumero


        ;Ini Codigo--
            verificaNumero:
                cmp al,48d                 ;al=0
                je SiEsNumero    
                cmp al,49d                 ;al=1
                je SiEsNumero      
                cmp al,50d                 ;al=2
                je SiEsNumero      
                cmp al,51d                 ;al=3
                je SiEsNumero      
                cmp al,52d                 ;al=4
                je SiEsNumero      
                cmp al,53d                 ;al=5
                je SiEsNumero      
                cmp al,54d                 ;al=6
                je SiEsNumero      
                cmp al,55d                 ;al=7
                je SiEsNumero     
                cmp al,56d                 ;al=8
                je SiEsNumero      
                cmp al,57d                 ;al=9
                je SiEsNumero       
                jmp NoEsNumero       ;no: Verificamos si es mayuscula
            ;fin etiqueta  


            NoEsNumero:
                mov bx,0d                    ;devuelve 0
                jmp FIN
            ;fin etiqueta

            SiEsNumero:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
        ;fin etiqueta    
    EsNumero endp

    EsOperador proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es operador                              ;
        ;                BX = 1  es operado                                  ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si es letra o no      ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verificaOperador


        ;Ini Codigo--
            verificaOperador:
                cmp al,33D                 ;al=!
                je SiEsOperador    
                cmp al,42D                 ;al=*
                je SiEsOperador      
                cmp al,37D                 ;al=%
                je SiEsOperador      
                cmp al,47D                 ;al=/
                je SiEsOperador      
                cmp al,43D                 ;al=+
                je SiEsOperador      
                cmp al,45D                 ;al=-
                je SiEsOperador       
                jmp NoEsOperador       ;no: Verificamos si es mayuscula
            ;fin etiqueta  


            NoEsOperador:
                mov bx,0d                    ;devuelve 0
                jmp FIN
            ;fin etiqueta

            SiEsOperador:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
        ;fin etiqueta    
    EsOperador endp

    EsBlanco proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es un Blanco                             ;
        ;                BX = 1  es un Blanco                                ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si es un blanco o no  ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verificaBlanco


        ;Ini Codigo--
            verificaBlanco:
                cmp al,32D                  ;al=space
                je SiEsUnBlanco    
                cmp al,10D                  ;al=salto linea
                je SiEsUnBlanco      
                cmp al,13D                  ;al=retorno carro
                je SiEsUnBlanco      
                cmp al,9D                   ;al=tabulador
                je SiEsUnBlanco      
                jmp NoEsUnBlanco            ;no: Verificamos si es mayuscula
            ;fin etiqueta  


            NoEsUnBlanco:
                mov bx,0d                 
                jmp FIN
            ;fin etiqueta

            SiEsUnBlanco:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
        ;fin etiqueta    
    EsBlanco endp   

    EsMayor proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es mayor                                 ;
        ;                BX = 1  es mayor                                    ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si esmayor o no       ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verificaMayor


        ;Ini Codigo--
            verificaMayor:
                cmp al,62D                  ;al=>
                je SiEsMayor    
                jmp NoEsMayor    
            ;fin etiqueta  


            NoEsMayor:
                mov bx,0d                 
                jmp FIN
            ;fin etiqueta

            SiEsMayor:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
        ;fin etiqueta    
    EsMayor endp

    EsMenor proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es mayor                                 ;
        ;                BX = 1  es mayor                                    ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si esmayor o no       ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verificaMenor


        ;Ini Codigo--
            verificaMenor:
                cmp al,60D                  ;al=<
                je SiEsMenor    
                jmp NoEsMenor    
            ;fin etiqueta  


            NoEsMenor:
                mov bx,0d                 
                jmp FIN
            ;fin etiqueta

            SiEsMenor:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
        ;fin etiqueta    
    EsMenor endp

    EsBarraInvertida proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es mayor                                 ;
        ;                BX = 1  es mayor                                    ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si esmayor o no       ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verificaBarraInvertida


        ;Ini Codigo--
            verificaBarraInvertida:
                cmp al,47D                  ;al=/
                je SiEsBarraInvertida    
                jmp NoEsBarraInvertida    
            ;fin etiqueta  


            NoEsBarraInvertida:
                mov bx,0d                 
                jmp FIN
            ;fin etiqueta

            SiEsBarraInvertida:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
        ;fin etiqueta    
    EsBarraInvertida endp
    
    EsPtoComa proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es punto y coma                          ;
        ;                BX = 1  es punto y coma                             ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si punto y coma o no  ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verificaPtoComa

        ;Ini Codigo--
            verificaPtoComa:
                cmp al,59D                  ;al=;
                je SiEsPtoComa    
                jmp NoEsPtoComa    
            ;fin etiqueta  

            NoEsPtoComa:
                mov bx,0d                 
                jmp FIN
            ;fin etiqueta

            SiEsPtoComa:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
        ;fin etiqueta    
    EsPtoComa endp

    EsPunto proc 
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es punto y coma                          ;
        ;                BX = 1  es punto y coma                             ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si punto y coma o no  ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verficaPunto

        ;Ini Codigo--
            verficaPunto:
                cmp al,46D                  ;al='.'
                je SiEsPunto    
                jmp NoEsPunto    
            ;fin etiqueta  

            NoEsPunto:
                mov bx,0d                 
                jmp FIN
            ;fin etiqueta

            SiEsPunto:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
    EsPunto endp

    EsFin proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DS:[bp+4] apunta al caracter                        ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es punto y coma                          ;
        ;                BX = 1  es punto y coma                             ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si punto y coma o no  ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push bp                    ;almacenamos el puntero base
        mov  bp,sp                 ;ebp contiene la direccion de esp
        push ax
        mov al,byte ptr[bp+4]        ;al = caracter
        jmp verificaFin

        ;Ini Codigo--
            verificaFin:
                cmp al,0                  ;al=0
                je SiEsFin    
                jmp NoEsFin    
            ;fin etiqueta  

            NoEsFin:
                mov bx,0d                 
                jmp FIN
            ;fin etiqueta

            SiEsFin:
                mov bx,1d
                jmp FIN
            ;fin etiqueta

        ;Fin Codigo--

        ;Subrutina epilogo
        FIN:
            pop ax
            mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
            pop bp                  ;restaura el valor del puntro base listo para el ret
            ret 2 
        ;fin etiqueta    
    EsFin endp

;================== Fin Verificando Caracteres ==========================

;================== Ini Automata ========================================

    getToken proc 
        ;--------------------------------------------------------------------
        ;   Recibe:       DS:[bp+4] apunta al caracter                        
        ;                                                                    
        ;   Devuelve:     idToken = el codigo del token asocdiado
        ;                 lexema = el contenido del token                          
        ;                                                                            
        ;   Comentarios: Obtiene un token del string enviado
        ;--------------------------------------------------------------------

        ;Ini Subrutina proglogo
            push bp                     ;almacenamos el puntero base
            mov  bp,sp                  ;ebp contiene la direccion de esp
            push di
            push si 
            push ax
            mov di,word ptr[bp+4]       ;di = apuntador del caracter
            dec di  
        ;Fin Subrutina proglogo

        ;Ini Codigo--
            limpiarCadena lexema                ;limipiamos el contenido el token 
            xor si,si
                  
            S0:
                inc di
                Blanco di
                cmp bx,1                        ;¿es un blanco?
                je S0
                Menor di
                cmp bx,1                        ;¿es menor?
                je S1                       
                Numero di   
                cmp bx,1                        ;¿es un numero?    
                je S5       

                jmp error                             
            ;fin
            S1:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] ='<'
                inc si
                inc di

                Letra di 
                cmp bx,1
                je S2
                BarraInvertida di
                cmp bx,1
                je S4
                jmp error

            ;fin
            S2:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =letra
                inc si
                inc di

                Letra di
                cmp bx,1
                je S2
                Numero di
                cmp bx,1
                je S3

                jmp error
            ;fin
            S3:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =numero
                inc si
                inc di

                Numero di
                cmp bx,1
                je S10


                Mayor di
                cmp bx,1                    
                js S11

                jmp error
            ;fin
            S4:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =/
                inc si
                inc di

                Letra di
                cmp bx,1
                je S2

                jmp error
            ;fin
            S5:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =numero
                inc si
                inc di

                Numero di
                cmp bx,1
                je S5

                PtoComa di
                cmp bx,1
                je S9

                punto di
                cmp bx,1
                je S6

                Operador di
                cmp bx,1
                je S7

                jmp error
            ;fin
            S6:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =punto
                inc si
                inc di

                Numero di
                cmp bx,1
                je S6

                PtoComa di
                cmp bx,1
                je S9


                Operador di
                cmp bx,1
                je S7

                jmp error
            ;fin
            S7:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =operador
                inc si
                inc di

                Numero di
                cmp bx,1
                je S5


                Operador di
                cmp bx,1
                je S8

                jmp error
            ;fin
            S8:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =operador
                inc si
                inc di

                Numero di
                cmp bx,1
                je S5

                jmp error
            ;fin
            ;Estado Aceptacion
            S9:
                inc si
                inc di

                jmp FIN
            ;fin
            S10:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =Numero
                inc si
                inc di

                Mayor di
                cmp bx,1
                je S11

                jmp error
            ;fin
            ;Estado Aceptacion
            S11:
                inc si
                inc di

                jmp FIN
            ;fin
            error:
            ;fin 
        ;Fin Codigo--

        ;Ini Subrutina epilogo
            FIN:
                pop ax
                pop si
                pop di
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 2 
            ;fin etiqueta  
        ;Fin Subrutina epilogo  
    getToken endp


;================== Fin Automata ========================================