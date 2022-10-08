.include "asm/title.d.asm"
.include "asm/eboot.bin.asm"

.definelabel strcpy_with_vars, 0x088197a0
    ; a0 destination
    ; a1 source

.definelabel draw_text, 0x08820ef4
    ; a0 text pointer
    ; a1 x
    ; a2 y
    ; a3 z?
    ; t0 color
    ; t1 transparency

.definelabel draw_character, 0x08820930
    ; a0 character
    ; a1 x
    ; a2 y
    ; a3 z?
    ; t0 color
    ; t1 transparency

.definelabel get_char_width, 0x08821c04
    ; a0 char id