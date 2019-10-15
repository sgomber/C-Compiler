.data
arr_2_main: .space 80
i_2_main: .word 0
newline: .asciiz "\n"
.text
.globl main
main:
L2: li $t0, 0
L3: la $t1, arr_2_main
L4: li $t2, 0
L5: li $t3, 1
L6: mul $t3, $t3, $t0
L7: add $t2, $t2, $t3
L8: li $t3, 4
L9: mul $t2, $t2, $t3
L10: li $t0, 1
L11: add $t1, $t1, $t2
sw $t0, ($t1)
L12: li $t0, 1
L13: la $t1, arr_2_main
L14: li $t2, 0
L15: li $t3, 1
L16: mul $t3, $t3, $t0
L17: add $t2, $t2, $t3
L18: li $t3, 4
L19: mul $t2, $t2, $t3
L20: li $t0, 1
L21: add $t1, $t1, $t2
sw $t0, ($t1)
L22: li $t0, 2
L23: sw $t0, i_2_main
L24: lw $t0, i_2_main
L25: li $t1, 20
L26: li $t2, 1
L27: sub $s0, $t0, $t1
     bltz $s0, L29
L28: li $t2, 0
L29: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L86
L30: b L36
L31: lw $t0, i_2_main
L32: li $t1, 1
L33: add $t2, $t0, $t1
L34: sw $t2, i_2_main
L35: b L24
L36: lw $t0, i_2_main
L37: la $t1, arr_2_main
L38: li $t2, 0
L39: li $t3, 1
L40: mul $t3, $t3, $t0
L41: add $t2, $t2, $t3
L42: li $t3, 4
L43: mul $t2, $t2, $t3
L44: lw $t0, i_2_main
L45: li $t3, 1
L46: sub $t4, $t0, $t3
L47: la $t0, arr_2_main
L48: li $t3, 0
L49: li $t5, 1
L50: mul $t5, $t5, $t4
L51: add $t3, $t3, $t5
L52: li $t5, 4
L53: mul $t3, $t3, $t5
L54: add $t0, $t0, $t3
lw $t4, ($t0)
L55: lw $t0, i_2_main
L56: li $t3, 2
L57: sub $t5, $t0, $t3
L58: la $t0, arr_2_main
L59: li $t3, 0
L60: li $t6, 1
L61: mul $t6, $t6, $t5
L62: add $t3, $t3, $t6
L63: li $t6, 4
L64: mul $t3, $t3, $t6
L65: add $t0, $t0, $t3
lw $t5, ($t0)
L66: add $t0, $t4, $t5
L67: add $t1, $t1, $t2
sw $t0, ($t1)
L68: lw $t0, i_2_main
L69: li $t1, 5
L70: li $t2, 1
L71: sub $s0, $t0, $t1
     beqz $s0, L73
L72: li $t2, 0
L73: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L75
L74: b L86
L75: lw $t0, i_2_main
L76: la $t1, arr_2_main
L77: li $t2, 0
L78: li $t3, 1
L79: mul $t3, $t3, $t0
L80: add $t2, $t2, $t3
L81: li $t3, 4
L82: mul $t2, $t2, $t3
L83: add $t1, $t1, $t2
lw $t0, ($t1)
L84: addi $sp, $sp, -8
sw $a0, ($sp)
sw $v0, 4($sp)
li $v0, 1 
move $a0, $t0 
syscall
li $v0, 4
la $a0, newline
syscall
lw $a0, ($sp)
lw $v0, 4($sp)
addi $sp, $sp, 8
L85: b L31
L86: jr $ra

