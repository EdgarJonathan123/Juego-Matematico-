;================ Ini MenuPrincipal ================================
    msm0     db  '***UNIVERSIDAD DE SANCARLOS DE GUATEMALA***',13,10,'FACULTAD DE INGENIRIA',13,10,'CIENCIAS Y SISTEMAS',13,10,'ARQUITECTURA DE COMPUTADORES  Y ENSAMBLADORES 1',13,10,'SECCION B',13,10,'NOMBRE: EDGAR JONATHAN ARRECIS MARTINEZ',13,10,'CARNTE: 201602633',13,10,'TAREA PRACTICA 3',13,10,0
    msm8     db  '****Menu Principal *****',13,10,'1) Cargar Archivo ',13,10,'2) Jugar',13,10,'3) Top 10 Punteos',13,10,'4) Generar Reportes',13,10,'5) Salir',0
    msm20    db  'selecciono -> carga Archivo',13,10,0
    msm21    db  'selecciono -> Jugar',13,10,0
    msm22    db  'selecciono -> Top 10',13,10,0
    msm23    db  'selecciono -> Generar Reportes',13,10,0
    msm24    db  'selecciono -> Salir',13,10,0

    txt     db 91,'uno',93,0
    valor   db 91,'al: 000',93,0

    salto db 13,10,0
    tab   db 9,0

    corA db 91,0
    corC db 93,0
;================ Fin MenuPrincipal ================================

;================ Fin Alerta Archivos  ================================
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
;================ Fin Alerta Archivos  ================================

;================ Ini Variables Para Los Archivos =====================

    rutaArchivo db 100 dup(0)
    bufferLectura db 5000 dup(0)
    tokenAux       db 100  dup(0)
    bufferEscritura db 100 dup(0)

;================ Fin Variables Para Los Archivos =====================

;================ Ini Variables Globales ==============================
    hora db 'Hora: 00:00:00',13,10,0
    fecha db 'Fecha : 00,00,2019',13,10,0
;================ Fin Variables Globales ==============================