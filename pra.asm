;--------Ensamblador MASM arquitectura 80286
    include macro.asm
;================= DECLARACION TIPO DE EJECUTABLE ================
    .model small , stdcall
    .286
    .stack 100h
    .data
        include data.asm
;================= FIN TIPO DE EJECUTABLE ========================

.code
;================== SECCION DE CODIGO =============================
    include main.asm
    include proc.asm
    include ALex.asm
    include juego.asm
;================ FIN DE SECCION DE CODIGO ========================
end main
