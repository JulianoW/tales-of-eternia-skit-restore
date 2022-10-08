.open "files/original/PSP_GAME/USRDIR/dat/title.d","files/patched/PSP_GAME/USRDIR/dat/title.d",0x08AEA080
.psp
.org 0x08B0B190
cool_label:
.asciiz "By Julian Lightfellow"
.align 4

.func Get_Camp_Skit_Id
    addiu sp, sp, -0x20
    sw ra, 0x14(sp)
    sw s4, 0x10(sp)
    sw s3, 0xc(sp)
    sw s2, 0x8(sp)
    sw s1, 0x4(sp)
    sw s0, 0x0(sp)

    lui v1, 0x957
    lhu v0, -0x60fa(v1)
    andi v0, v0, 0x40

    beq v0, zero, @@end
    li v0, 0x0

    jal 0x0882031c
    li s2, 0x0

    move s4, v0

    li s3, 0x08a5aaa8

@@loop1:
    sll v0, s2, 0x3
    addu s0, v0, s3
    lbu a0, 0x1(s0)
    jal 0x08847a78
    addiu s1, s2, 0x1
    bne v0, zero, @@loop4
    nop

@@loop2:
    slti v0, s1, 0x108

@@loop3:
    bne v0, zero, @@loop1
    move s2, s1
    b @@end
    li v0, 0x0

@@loop4:
    jal 0x088483cc
    lhu a0, 0x2(s0)
    beq v0, zero, @@loop2
    seh a0, s2
    jal 0x0881e8b4
    nop
    bne v0, zero, @@loop3
    slti v0, s1, 0x108
    lh v0, 0x4(s0)
    slt v0, s4, v0
    bne v0, zero, @@loop3
    lh v0, 0x6(s0)
    slt v0, s4, v0
    beq v0, zero, @@loop3
    slti v0, s1, 0x108
    seh s0, s1
    jal 0x08847c5c
    move a0, s0
    beql v0, zero, @@loop3
    slti v0, s1, 0x108
    move v0, s0

@@end:
    lw ra, 0x14(sp)
    lw s4, 0x10(sp)
    lw s3, 0xc(sp)
    lw s2, 0x8(sp)
    lw s1, 0x4(sp)
    lw s0, 0x0(sp)
    jr ra
    addiu sp, sp, 0x20
.endfunc

.func Draw_Text_In_Menu
	addiu sp, sp, -0x30
	sw ra, 0x2c(sp)
    sw a0, 0x28(sp)
    sw a1, 0x24(sp)
    sw a2, 0x20(sp)
    sw a3, 0x1c(sp)
    sw t0, 0x18(sp)
    sw t1, 0x14(sp)
    sw v0, 0x10(sp)
    sw v1, 0xc(sp)

    li a0, cool_label
    li a1, 0x30
    li a2, 0x30
    li a3, 0xff
    li t0, 0xf
    jal draw_text
    li t1, 0xff

@@end:

    lw a0, 0x28(sp)
    lw a1, 0x24(sp)
    lw a2, 0x20(sp)
    lw a3, 0x1c(sp)
    lw t0, 0x18(sp)
    lw t1, 0x14(sp)
    lw ra, 0x2c(sp)
    lw v0, 0x10(sp)
    lw v1, 0xc(sp)
    li s6, 0x0
    lui s5, 0x957
    jr ra
    addiu sp, sp, 0x30


.endfunc


.close