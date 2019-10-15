.data
x_2_main: .word 0
newline: .asciiz "\n"
.text
.globl main
main:
L2: li $t0, 10
L3: sw $t0, x_2_main
L4: lw $t0, x_2_main
L5: li $s0, 0
sub $s0, $t0, $s0
     beqz $s0, L13
L6: lw $t0, x_2_main
L7: addi $sp, $sp, -8
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
L8: lw $t0, x_2_main
L9: li $t1, 1
L10: sub $t2, $t0, $t1
L11: sw $t2, x_2_main
L12: b L4
L13: jr $ra

