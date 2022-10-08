.open "files/original/PSP_GAME/SYSDIR/EBOOT.BIN","files/patched/PSP_GAME/SYSDIR/EBOOT.BIN",0x08803F80
.psp

; Jump to restored get camp skit id function
; There's an issue where addresses with existing jal
; instructions are being adjusted on boot.
; Used a j from inside the jr ra / li v0, 0x0 function instead
.org 0x088484d4
    j Get_Camp_Skit_Id
    nop

; Replace NA skit table with JP skit table
; table contains pointers to areas inside the fc_us.v file
.org 0x08a5bab0
    .incbin "skit_table.bin"
.close