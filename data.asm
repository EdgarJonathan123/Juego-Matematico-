;================ Fin Variables Globales ==============================
    ;Ini Uso de la Hora
        hora db 'Hora: 00:00:00',13,10,0
        fecha db 'Fecha : 00,00,2019',13,10,0
    ;Fin Uso de la Hora


    ;Ini Caracter
        valor   db 91,'al: 000',93,0
        space db 32,0
        salto db 13,10,0
        tab   db 9,0
        corA db 91,0
        corC db 93,0
        texto db    91,'fdd',93,0
        aux   db 100 dup(0)
       ;Fin Caracter
    
    ;Ini numeros
        Num db 10 dup(0)
    ;Fin numeros



;================ Fin Variables Globales ==============================

;================ Ini MenuPrincipal ===================================
    msm0     db  '***UNIVERSIDAD DE SANCARLOS DE GUATEMALA***',13,10,'FACULTAD DE INGENIRIA',13,10,'CIENCIAS Y SISTEMAS',13,10,'ARQUITECTURA DE COMPUTADORES  Y ENSAMBLADORES 1',13,10,'SECCION B',13,10,'NOMBRE: EDGAR JONATHAN ARRECIS MARTINEZ',13,10,'CARNTE: 201602633',13,10,'TAREA PRACTICA 3',13,10,0
    msm8     db   13,10,'****Menu Principal *****',13,10,'1) Cargar Archivo ',13,10,'2) Jugar',13,10,'3) Top 10 Punteos',13,10,'4) Generar Reportes',13,10,'5) Salir',0
    msm20    db  'selecciono -> carga Archivo',13,10,0
    msm21    db  'selecciono -> Jugar',13,10,0
    msm22    db  'selecciono -> Top 10',13,10,0
    msm23    db  'selecciono -> Generar Reportes',13,10,0
    msm24    db  'selecciono -> Salir',13,10,0

;================ Fin MenuPrincipal ===================================

;================ Ini Variables Para Los Archivos =====================

    ;Ini variables archivos
        ;rutaArchivo db 100 dup(0)
        rutaArchivo db 'pr/entrada.txt',0
        bufferLectura db 5000 dup(0)
        ptrfileLectura dw ?     
    ;Fin variables archivos

    ;Ini Alerta Archivos
        msmsucces1 db  'Se Abrio el archivo exitosamente',0
        msmsucces2 db  'Se leyo el archivo con exito',0
        msmsucces3 db  'Se creo el archivo con exito',0
        msmsucces4 db  'Se Escribio el reporte con exito',0
        msmsucces5 db  'Se cerro el archivo con exito',0

        msmError1 db  'Error al abrir archivo',0
        msmError2 db  'Error al leer archivo',0
        msmError3 db  'Error al crear archivo',0
        msmError4 db  'Error al escribir reporte',0
        msmError5 db  'Error al Cerrar el archivo',0
    ;Fin alerta Archivos

;================ Fin Variables Para Los Archivos =====================

;================ Ini Variables Para el Juego =========================
    nombre db 9,62,62,' Nombre: ',0
    aleatorio db 13,10,9,62,62,' Random? y/n: ',0
    noOperacion db 13,10,9,62,62,' #De Operacion: ',0

    inInvalida db 13,10,9,62,62,'Entrada invalida',0
    pin        db 13,10,9,62,62,0
    

    NamePlayer db 50 dup(0)

;================ Fin Variables Para el Juego =========================

;================ Ini Variables Analisis Lexico =======================


    errLexico   db 9,37,37,37,37,37,37,37,' Error Lexico ',37,37,37,37,37,37,37,0
    contLexico  db 9,'Caracter No Esperado: ',0
    caracterLex db 9,0,0

    tokenEncontrado db 9,37,37,37,37,37,37,37,' Token Encontrado',37,37,37,37,37,37,37,0


    ;pivoteLex db  0d  ;apunta al caracter acutal del analisis lexico
    idToken   db  24d  ;ver tabla de tokens en tokens.txt
    lexema    db  50 dup(0)
    ptrExpr   word  0d   ;cuenta cuantas expresiones hay actualmente
    tamanioExp   word 0d

    prueba    db  '999',0
    
    
    ;Ini Expresiones
        expresion db 50 dup(0)
        expr0 db 50 dup(0)
        expr1 db 50 dup(0)
        expr2 db 50 dup(0)
        expr3 db 50 dup(0)
        expr4 db 50 dup(0)
        expr5 db 50 dup(0)
        expr6 db 50 dup(0)
        expr7 db 50 dup(0)
        expr8 db 50 dup(0)
        expr9 db 50 dup(0)
    ;Fin Expresiones

    ;Ini Palabras Reservadas
        PRarquiA    db 60,'arqui1',62,0
        PrarquiC    db 60,47,'arqui1',62,0
        PRop1A      db 60,'operacion1',62,0
        PRop1C      db 60,47,'operacion1',62,0
        PRop2A      db 60,'operacion2',62,0
        PRop2C      db 60,47,'operacion2',62,0
        PRop3A      db 60,'operacion3',62,0
        PRop3C      db 60,47,'operacion3',62,0
        PRop4A      db 60,'operacion4',62,0
        PRop4C      db 60,47,'operacion4',62,0
        PRop5A      db 60,'operacion5',62,0
        PRop5C      db 60,47,'operacion5',62,0
        PRop6A      db 60,'operacion6',62,0
        PRop6C      db 60,47,'operacion6',62,0
        PRop7A      db 60,'operacion7',62,0
        PRop7C      db 60,47,'operacion7',62,0
        PRop8A      db 60,'operacion8',62,0
        PRop8C      db 60,47,'operacion8',62,0
        PRop9A      db 60,'operacion9',62,0
        PRop9C      db 60,47,'operacion9',62,0
        PRop10A     db 60,'operacion10',62,0
        PRop10C     db 60,47,'operacion10',62,0
    ;Fin Palabras Reservadas

;================ Fin Variables Analisis Lexico =======================

;================ Fin Variables PostFijo ==============================

    VOperador db '00',0     ;para saber que operador se encontro
    ErrorOp   db 'Ocurrio algun error xd',0

;================ Fin Variables PostFijo===============================