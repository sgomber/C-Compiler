.data
arr_2_main: .space 240
i_2_main: .float 0.0
j_2_main: .float 0.0
k_2_main: .word 0
newline: .asciiz "\n"
.text
.globl main
main:
L2: li $t0, 0
L3: sw $t0, i_2_main
L4: lw $t0, i_2_main
L5: li $t1, 3
L6: li $t2, 1
L7: sub $s0, $t0, $t1
     bltz $s0, L9
L8: li $t2, 0
L9: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L73
L10: b L16
L11: lw $t0, i_2_main
L12: li $t1, 1
L13: add $t2, $t0, $t1
L14: sw $t2, i_2_main
L15: b L4
L16: li $t0, 0
L17: sw $t0, j_2_main
L18: lw $t0, j_2_main
L19: li $t1, 4
L20: li $t2, 1
L21: sub $s0, $t0, $t1
     bltz $s0, L23
L22: li $t2, 0
L23: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L11
L24: b L30
L25: lw $t0, j_2_main
L26: li $t1, 1
L27: add $t2, $t0, $t1
L28: sw $t2, j_2_main
L29: b L18
L30: li $t0, 0
L31: sw $t0, k_2_main
L32: lw $t0, k_2_main
L33: li $t1, 5
L34: li $t2, 1
L35: sub $s0, $t0, $t1
     bltz $s0, L37
L36: li $t2, 0
L37: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L25
L38: b L44
L39: lw $t0, k_2_main
L40: li $t1, 1
L41: add $t2, $t0, $t1
L42: sw $t2, k_2_main
L43: b L32
L44: lw $t0, i_2_main
L45: lw $t1, j_2_main
L46: lw $t2, k_2_main
L47: la $t3, arr_2_main
L48: li $t4, 0
L49: li $t5, 20
L50: mul $t5, $t5, $t0
L51: add $t4, $t4, $t5
L52: li $t5, 5
L53: mul $t5, $t5, $t1
L54: add $t4, $t4, $t5
L55: li $t5, 1
L56: mul $t5, $t5, $t2
L57: add $t4, $t4, $t5
L58: li $t5, 4
L59: mul $t4, $t4, $t5
L60: li $t0, 100
L61: lw $t1, i_2_main
L62: mul $t2, $t0, $t1
L63: li $t0, 10
L64: lw $t1, j_2_main
L65: mul $t5, $t0, $t1
L66: add $t0, $t2, $t5
L67: lw $t1, k_2_main
L68: add $t2, $t0, $t1
L69: add $t3, $t3, $t4
sw $t2, ($t3)
L70: b L39
L71: b L25
L72: b L11
L73: li $t0, 0
L74: sw $t0, i_2_main
L75: lw $t0, i_2_main
L76: li $t1, 3
L77: li $t2, 1
L78: sub $s0, $t0, $t1
     bltz $s0, L80
L79: li $t2, 0
L80: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L136
L81: b L87
L82: lw $t0, i_2_main
L83: li $t1, 1
L84: add $t2, $t0, $t1
L85: sw $t2, i_2_main
L86: b L75
L87: li $t0, 0
L88: sw $t0, j_2_main
L89: lw $t0, j_2_main
L90: li $t1, 4
L91: li $t2, 1
L92: sub $s0, $t0, $t1
     bltz $s0, L94
L93: li $t2, 0
L94: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L82
L95: b L101
L96: lw $t0, j_2_main
L97: li $t1, 1
L98: add $t2, $t0, $t1
L99: sw $t2, j_2_main
L100: b L89
L101: li $t0, 0
L102: sw $t0, k_2_main
L103: lw $t0, k_2_main
L104: li $t1, 5
L105: li $t2, 1
L106: sub $s0, $t0, $t1
     bltz $s0, L108
L107: li $t2, 0
L108: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L96
L109: b L115
L110: lw $t0, k_2_main
L111: li $t1, 1
L112: add $t2, $t0, $t1
L113: sw $t2, k_2_main
L114: b L103
L115: lw $t0, i_2_main
L116: lw $t1, j_2_main
L117: lw $t2, k_2_main
L118: la $t3, arr_2_main
L119: li $t4, 0
L120: li $t5, 20
L121: mul $t5, $t5, $t0
L122: add $t4, $t4, $t5
L123: li $t5, 5
L124: mul $t5, $t5, $t1
L125: add $t4, $t4, $t5
L126: li $t5, 1
L127: mul $t5, $t5, $t2
L128: add $t4, $t4, $t5
L129: li $t5, 4
L130: mul $t4, $t4, $t5
L131: add $t3, $t3, $t4
lw $t0, ($t3)
L132: addi $sp, $sp, -8
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
L133: b L110
L134: b L96
L135: b L82
L136: jr $ra

