.data
x_2_main: .word 0
newline: .asciiz "\n"
.text
.globl main
main:
L2: li $t0, 5
L3: sw $t0, x_2_main
L4: lw $t0, x_2_main
L5: li $t1, 1
L6: sub $s0, $t0, $t1
     bnez $s0, L11
L7: li $t1, 100
L8: addi $sp, $sp, -8
sw $a0, ($sp)
sw $v0, 4($sp)
li $v0, 1 
move $a0, $t1 
syscall
li $v0, 4
la $a0, newline
syscall
lw $a0, ($sp)
lw $v0, 4($sp)
addi $sp, $sp, 8
L9: b L25
L10: b L13
L11: li $t1, 5
L12: sub $s0, $t0, $t1
     bnez $s0, L16
L13: li $t1, 500
L14: addi $sp, $sp, -8
sw $a0, ($sp)
sw $v0, 4($sp)
li $v0, 1 
move $a0, $t1 
syscall
li $v0, 4
la $a0, newline
syscall
lw $a0, ($sp)
lw $v0, 4($sp)
addi $sp, $sp, 8
L15: b L18
L16: li $t1, 7
L17: sub $s0, $t0, $t1
     bnez $s0, L22
L18: li $t1, 700
L19: addi $sp, $sp, -8
sw $a0, ($sp)
sw $v0, 4($sp)
li $v0, 1 
move $a0, $t1 
syscall
li $v0, 4
la $a0, newline
syscall
lw $a0, ($sp)
lw $v0, 4($sp)
addi $sp, $sp, 8
L20: b L25
L21: b L22
L22: li $t1, 1000
L23: addi $sp, $sp, -8
sw $a0, ($sp)
sw $v0, 4($sp)
li $v0, 1 
move $a0, $t1 
syscall
li $v0, 4
la $a0, newline
syscall
lw $a0, ($sp)
lw $v0, 4($sp)
addi $sp, $sp, 8
L24: b L25
L25: jr $ra

