
;================== Ini Verificando Caracteres =========================
    EsLetra proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es letra                                 ;
        ;                BX = 1  es letra                                    ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si es letra o no      ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
            push ax
            mov al,[di]        ;al = caracter
            jmp VerificaMinuscula
        ;Fin Subrutina prologo

        ;Ini Codigo--
            VerificaMinuscula:

                cmp al,105                 ;al=i
                je SiEsLetra      

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
                ret  
            ;fin etiqueta   
        ;Surutina Epilogo 
    EsLetra endp

    EsNumero proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es numero                                ;
        ;                BX = 1  es numero                                   ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si es letra o no      ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push ax
        xor ax,ax
        mov al,[di]        ;al = caracter
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
            ret  
        ;fin etiqueta    
    EsNumero endp

    EsOperador proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es operador                              ;
        ;                BX = 1  es operado                                  ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si es letra o no      ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push ax
        mov al,[di]        ;al = caracter
        jmp verificaOperador


        ;Ini Codigo--
            verificaOperador:
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
            ret  
        ;fin etiqueta    
    EsOperador endp

    EsBlanco proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;   Devuelve:    BX = 0  no es un Blanco                             ;
        ;                BX = 1  es un Blanco                                ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si es un blanco o no  ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push ax
        mov al,[di]       ;al = caracter
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
            ret  
        ;fin etiqueta    
    EsBlanco endp   

    EsMayor proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es mayor                                 ;
        ;                BX = 1  es mayor                                    ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si esmayor o no       ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push ax
        mov al,[di]        ;al = caracter
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
            ret  
        ;fin etiqueta    
    EsMayor endp

    EsMenor proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es mayor                                 ;
        ;                BX = 1  es mayor                                    ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si esmayor o no       ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
            push ax
            mov al,[di]                     ;al = caracter
            jmp verificaMenor

        ;Ini Codigo--
            verificaMenor:
                cmp al,60D                  ;al=<
               
                je SiEsMenor    
                jmp NoEsMenor    
            ;fin etiqueta  


            NoEsMenor:
                ;print texto
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
            ret  
        ;fin etiqueta    
    EsMenor endp

    EsBarraInvertida proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es mayor                                 ;
        ;                BX = 1  es mayor                                    ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si esmayor o no       ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
            push ax
            mov al,[di]                     ;al = caracter
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
            ret  
        ;fin etiqueta    
    EsBarraInvertida endp
    
    EsPtoComa proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es punto y coma                          ;
        ;                BX = 1  es punto y coma                             ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si punto y coma o no  ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push ax
        mov al,[di]        ;al = caracter
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
            ret  
        ;fin etiqueta    
    EsPtoComa endp

    EsFactorial proc
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es punto y coma                          ;
        ;                BX = 1  es punto y coma                             ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si punto y coma o no  ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push ax
        mov al,[di]        ;al = caracter
        jmp verificaPtoComa

        ;Ini Codigo--
            verificaPtoComa:
                cmp al,33d                  ;al=!
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
            ret  
        ;fin etiqueta    
    EsFactorial endp

    EsPunto proc 
        ;--------------------------------------------------------------------;
        ;   Recibe:      DI apunta al caracter                               ;
        ;                                                                    ;
        ;   Devuelve:    BX = 0  no es punto y coma                          ;
        ;                BX = 1  es punto y coma                             ;
        ;                                                                    ;        
        ;   Comentarios: Recibe un caracter y verifica si punto y coma o no  ;
        ;--------------------------------------------------------------------;

        ;Subrutina proglogo
        push ax
        mov al,[di]        ;al = caracter
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
            ret  
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
        push ax
        mov al,[di]        ;al = caracter
        jmp verificaFin

        ;Ini Codigo--
            verificaFin:
                cmp al,0                  ;al=0
                je SiEsFin    
                cmp al,'$'                 ;otra forma de ver el fin de cadena
                je siEsFin
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
            ret  
        ;fin etiqueta    
    EsFin endp

;================== Fin Verificando Caracteres ==========================

;================== Ini Automata ========================================

    aumentarExpr proc
        push ax
        mov ax,ptrExpr[0]
        add ax,1D
        mov ptrExpr[0],ax
        pop ax
        ret
    aumentarExpr endp

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
            push si 
            push ax
            mov di,word ptr[bp+4]       ;di = apuntador del caracter
            dec di  
        ;Fin Subrutina proglogo

        ;Ini Codigo--
            limpiarCadena lexema                ;limipiamos el contenido el token 
            xor si,si
            xor ax,ax
                  
            S0:
                inc di
                Blanco di
                cmp bx,1                        ;¿es un blanco?
                je S0

                Menor di                        ;¿es menor?
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
                mov al, byte ptr[di]


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
                mov al, byte ptr[di]

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
                mov al, byte ptr[di]
                

                Mayor di
                cmp bx,1                    
                je S11

                Numero di
                cmp bx,1
                je S10

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
                mov al,byte ptr[di]

                Blanco di
                cmp bx,1                        ;¿es un blanco?
                je S5


                FAC di
                cmp bx,1
                je S12

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

                Blanco di
                cmp bx,1                        ;¿es un blanco?
                je S6


                Numero di
                cmp bx,1
                je S6


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

                Blanco di
                cmp bx,1                        ;¿es un blanco?
                je S7

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

                Blanco di
                cmp bx,1                        ;¿es un blanco?
                je S8


                Numero di
                cmp bx,1
                je S5

                jmp error
            ;fin
            ;Estado Aceptacion
            S9:
                inc si
                inc di

                mov idToken[0],1d
                mov ax,ptrExpr[0]

                cmp ax,0D
                je EXPRESION0

                cmp ax,1D
                je EXPRESION1

                cmp ax,2D
                je EXPRESION2

                cmp ax,3D
                je EXPRESION3

                cmp ax,4D
                je EXPRESION4

                cmp ax,5D
                je EXPRESION5

                cmp ax,6D
                je EXPRESION6

                cmp ax,7D
                je EXPRESION7

                cmp ax,8D
                je EXPRESION8

                cmp ax,9D
                je EXPRESION9

                jmp error
            ;fin
            S10:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =Numero
                inc si
                inc di

                mov al, byte ptr[di]

                ;imprimir

                Mayor di
                cmp bx,1
                je S11

                jmp error
            ;fin
            ;Estado Aceptacion
            S11:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =Numero
                inc si
                inc di

                Aminuscula lexema           

                compararCadena lexema,PRarquiA
                je ARQUIA
                compararCadena lexema,PrarquiC
                je ARQUIC
                compararCadena lexema,PRop1A
                je OP1A
                compararCadena lexema,PRop1C
                je OP1C
                compararCadena lexema,PRop2A
                je OP2A
                compararCadena lexema,PRop2C
                je OP2C
                compararCadena lexema,PRop3A
                je OP3A
                compararCadena lexema,PRop3C
                je OP3C
                compararCadena lexema,PRop4A
                je OP4A
                compararCadena lexema,PRop4C
                je OP4C
                compararCadena lexema,PRop5A
                je OP5A
                compararCadena lexema,PRop5C
                je OP5C
                compararCadena lexema,PRop6A
                je OP6A
                compararCadena lexema,PRop6C
                je OP6C
                compararCadena lexema,PRop7A
                je OP7A
                compararCadena lexema,PRop7C
                je OP7C
                compararCadena lexema,PRop8C
                je OP8C
                compararCadena lexema,PRop9A
                je OP9A
                compararCadena lexema,PRop9C
                je OP9C
                compararCadena lexema,PRop10A
                je OP10A
                compararCadena lexema,PRop10C
                je OP10C

                mov idToken[0],25d
                jmp FIN

            ;fin
            S12:
                mov al, byte ptr[di]
                mov lexema[si],al               ;lexema[si] =operador
                inc si
                inc di

                Blanco di
                cmp bx,1                        ;¿es un blanco?
                je S12

                PtoComa di
                cmp bx,1
                je S9


                Numero di
                cmp bx,1
                je S5

                jmp error
            ;fin
            error:
                FinCad di
                cmp bx,1                    ;es fin de cadena?
                je FinCadena
                
                mov al,byte ptr[di]
                mov caracterLex[1],al
            
                println errLexico
                print  contLexico
                println  caracterLex

                inc di

                mov idToken[0],25d
                jmp FIN
            ;fin 

            ;Ini Expr
                EXPRESION0:
                    copiarCadena lexema,expr0               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
                EXPRESION1:
                    copiarCadena lexema,expr1               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
                EXPRESION2:
                    copiarCadena lexema,expr2               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
                EXPRESION3:
                    copiarCadena lexema,expr3               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
                EXPRESION4:
                    copiarCadena lexema,expr4               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
                EXPRESION5:
                    copiarCadena lexema,expr5               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
                EXPRESION6:
                    copiarCadena lexema,expr6               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                
                ;fin etiqueta
                EXPRESION7:
                    copiarCadena lexema,expr7               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
                EXPRESION8:
                    copiarCadena lexema,expr8               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
                EXPRESION9:
                    copiarCadena lexema,expr9               ;copiamos el token a la expr
                    call aumentarExpr

                    jmp FIN
                ;fin etiqueta
            ;Fin Expr

            ;Ini tokens
                FinCadena:
                    mov idToken[0],0
                    jmp FIN
                ;fin etiqueta

                ARQUIA:
                    mov idToken[0],2d
                    jmp FIN

                ;fin etiqueta
                ARQUIC:
                    mov idToken[0],3d
                    jmp FIN
                ;fin etiqueta
                
                OP1A:
                    mov idToken[0],4d
                    jmp FIN
                ;fin etiqueta
                OP1C:
                    mov idToken[0],5d
                    jmp FIN
                ;fin etiqueta

                OP2A:
                    mov idToken[0],6d
                    jmp FIN
                ;fin etiqueta
                OP2C:
                    mov idToken[0],7d
                    jmp FIN
                ;fin etiqueta

                OP3A:
                    mov idToken[0],8d
                    jmp FIN
                ;fin etiqueta
                OP3C:
                    mov idToken[0],9d
                    jmp FIN
                ;fin etiqueta

                OP4A:
                    mov idToken[0],10d
                    jmp FIN
                ;fin etiqueta
                OP4C:
                    mov idToken[0],11d
                    jmp FIN
                ;fin etiqueta

                OP5A:
                    mov idToken[0],12d
                    jmp FIN
                ;fin etiqueta
                OP5C:
                    mov idToken[0],13d
                    jmp FIN
                ;fin etiqueta

                OP6A:
                    mov idToken[0],14d
                    jmp FIN
                ;fin etiqueta
                OP6C:
                    mov idToken[0],15d
                    jmp FIN
                ;fin etiqueta

                OP7A:
                    mov idToken[0],16d
                    jmp FIN
                ;fin etiqueta
                OP7C:
                    mov idToken[0],17d
                    jmp FIN
                ;fin etiqueta

                OP8A:
                    mov idToken[0],18d
                    jmp FIN
                ;fin etiqueta
                OP8C:
                    mov idToken[0],19d
                    jmp FIN
                ;fin etiqueta

                OP9A:
                    mov idToken[0],20d
                    jmp FIN
                ;fin etiqueta
                OP9C:
                    mov idToken[0],21d
                    jmp FIN
                ;fin etiqueta

                OP10A:
                    mov idToken[0],22d
                    jmp FIN
                ;fin etiqueta
                OP10C:
                    mov idToken[0],23d
                    jmp FIN
                ;fin etiqueta

            ;Fin Tokens

        ;Fin Codigo--

        ;Ini Subrutina epilogo
            FIN:
                ;println tokenEncontrado
                ;print tab
                ;print corA
                ;print lexema
                ;print corC

                ;print tab
                ;mov al, idToken[0]
                ;printReg ax

                pop ax
                pop si
                mov sp,bp               ;esp vuelve apuntar al inicio y elimina las variables locales
                pop bp                  ;restaura el valor del puntro base listo para el ret
                ret 2 
            ;fin etiqueta  
        ;Fin Subrutina epilogo  
    getToken endp
   
    
    Analisis proc
        ;Fin Subrutina proglogo
            push ax
            mov di ,offset bufferLectura
        ;Ini Subrutina prologo

        ;Ini Codigo--
            BUCLE:
                mov al,idToken[0]
                cmp al,0   ;¿Es fin de cadena?
                je Fin
                
                obtenerToken di
                jmp BUCLE
            ;fin
        ;Fin Codigo--

        ;Ini Subrutina epilogo
            FIN:
                xor ax,ax
                mov ax, ptrExpr[0]
                printReg ax
                pop ax
                ret  
            ;fin etiqueta
        ;Fin Subrutina epilogo    
    Analisis endp


;================== Fin Automata ========================================