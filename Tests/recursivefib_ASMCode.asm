.data
x_2_main: .word 0
newline: .asciiz "\n"
.text
.globl main
fib:
L2: move $t0, $a0
L3: li $t1, 0
L4: li $t2, 1
L5: sub $s0, $t0, $t1
     beqz $s0, L7
L6: li $t2, 0
L7: move $t0, $a0
L8: li $t1, 1
L9: li $t3, 1
L10: sub $s0, $t0, $t1
     beqz $s0, L12
L11: li $t3, 0
L12: li $t0, 0
L13: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L16
L14: li $t0, 1
L15: b L19
L16: li $s0, 0
sub $s0, $t3, $s0
     beqz $s0, L19
L17: li $t0, 1
L18: b L19
L19: li $s0, 0
sub $s0, $t0, $s0
     beqz $s0, L22
L20: li $t0, 1
L21: move $v0, $t0
jr $ra
L22: move $t0, $a0
L23: li $t1, 1
L24: sub $t2, $t0, $t1
L25: addi $sp, $sp, -108
sw $a0, ($sp)
move $a0, $t2
L26: sw $a1, 4($sp)
sw $a2, 8($sp)
sw $a3, 12($sp)
sw $t0, 16($sp)
sw $t1, 20($sp)
sw $t2, 24($sp)
sw $t3, 28($sp)
sw $t4, 32($sp)
sw $t5, 36($sp)
sw $t6, 40($sp)
sw $t7, 44($sp)
sw $t8, 48($sp)
sw $t9, 52($sp)
swc1 $f0, 56($sp)
swc1 $f1, 60($sp)
swc1 $f2, 64($sp)
swc1 $f3, 68($sp)
swc1 $f4, 72($sp)
swc1 $f5, 76($sp)
swc1 $f6, 80($sp)
swc1 $f7, 84($sp)
swc1 $f8, 88($sp)
swc1 $f9, 92($sp)
swc1 $f20, 96($sp)
sw $s0, 100($sp)
sw $ra, 104($sp)
jal fib
lw $a0, ($sp)
lw $a1, 4($sp)
lw $a2, 8($sp)
lw $a3, 12($sp)
lw $t0, 16($sp)
lw $t1, 20($sp)
lw $t2, 24($sp)
lw $t3, 28($sp)
lw $t4, 32($sp)
lw $t5, 36($sp)
lw $t6, 40($sp)
lw $t7, 44($sp)
lw $t8, 48($sp)
lw $t9, 52($sp)
lwc1 $f0, 56($sp)
lwc1 $f1, 60($sp)
lwc1 $f2, 64($sp)
lwc1 $f3, 68($sp)
lwc1 $f4, 72($sp)
lwc1 $f5, 76($sp)
lwc1 $f6, 80($sp)
lwc1 $f7, 84($sp)
lwc1 $f8, 88($sp)
lwc1 $f9, 92($sp)
lwc1 $f20, 96($sp)
lw $s0, 100($sp)
lw $ra, 104($sp)
addi $sp, $sp, 108
L27: move $t0, $v0
L28: move $t1, $a0
L29: li $t2, 2
L30: sub $t3, $t1, $t2
L31: addi $sp, $sp, -108
sw $a0, ($sp)
move $a0, $t3
L32: sw $a1, 4($sp)
sw $a2, 8($sp)
sw $a3, 12($sp)
sw $t0, 16($sp)
sw $t1, 20($sp)
sw $t2, 24($sp)
sw $t3, 28($sp)
sw $t4, 32($sp)
sw $t5, 36($sp)
sw $t6, 40($sp)
sw $t7, 44($sp)
sw $t8, 48($sp)
sw $t9, 52($sp)
swc1 $f0, 56($sp)
swc1 $f1, 60($sp)
swc1 $f2, 64($sp)
swc1 $f3, 68($sp)
swc1 $f4, 72($sp)
swc1 $f5, 76($sp)
swc1 $f6, 80($sp)
swc1 $f7, 84($sp)
swc1 $f8, 88($sp)
swc1 $f9, 92($sp)
swc1 $f20, 96($sp)
sw $s0, 100($sp)
sw $ra, 104($sp)
jal fib
lw $a0, ($sp)
lw $a1, 4($sp)
lw $a2, 8($sp)
lw $a3, 12($sp)
lw $t0, 16($sp)
lw $t1, 20($sp)
lw $t2, 24($sp)
lw $t3, 28($sp)
lw $t4, 32($sp)
lw $t5, 36($sp)
lw $t6, 40($sp)
lw $t7, 44($sp)
lw $t8, 48($sp)
lw $t9, 52($sp)
lwc1 $f0, 56($sp)
lwc1 $f1, 60($sp)
lwc1 $f2, 64($sp)
lwc1 $f3, 68($sp)
lwc1 $f4, 72($sp)
lwc1 $f5, 76($sp)
lwc1 $f6, 80($sp)
lwc1 $f7, 84($sp)
lwc1 $f8, 88($sp)
lwc1 $f9, 92($sp)
lwc1 $f20, 96($sp)
lw $s0, 100($sp)
lw $ra, 104($sp)
addi $sp, $sp, 108
L33: move $t1, $v0
L34: add $t2, $t0, $t1
L35: move $v0, $t2
jr $ra
L36: jr $ra

main:
L38: li $t0, 6
L39: sw $t0, x_2_main
L40: lw $t0, x_2_main
L41: addi $sp, $sp, -112
sw $a0, ($sp)
move $a0, $t0
L42: sw $a1, 4($sp)
sw $a2, 8($sp)
sw $a3, 12($sp)
sw $t0, 16($sp)
sw $t1, 20($sp)
sw $t2, 24($sp)
sw $t3, 28($sp)
sw $t4, 32($sp)
sw $t5, 36($sp)
sw $t6, 40($sp)
sw $t7, 44($sp)
sw $t8, 48($sp)
sw $t9, 52($sp)
swc1 $f0, 56($sp)
swc1 $f1, 60($sp)
swc1 $f2, 64($sp)
swc1 $f3, 68($sp)
swc1 $f4, 72($sp)
swc1 $f5, 76($sp)
swc1 $f6, 80($sp)
swc1 $f7, 84($sp)
swc1 $f8, 88($sp)
swc1 $f9, 92($sp)
swc1 $f20, 96($sp)
sw $s0, 100($sp)
sw $ra, 104($sp)
lw $t0, x_2_main
sw $t0, 108($sp)
jal fib
lw $a0, ($sp)
lw $a1, 4($sp)
lw $a2, 8($sp)
lw $a3, 12($sp)
lw $t0, 108($sp)
sw $t0, x_2_main
lw $t0, 16($sp)
lw $t1, 20($sp)
lw $t2, 24($sp)
lw $t3, 28($sp)
lw $t4, 32($sp)
lw $t5, 36($sp)
lw $t6, 40($sp)
lw $t7, 44($sp)
lw $t8, 48($sp)
lw $t9, 52($sp)
lwc1 $f0, 56($sp)
lwc1 $f1, 60($sp)
lwc1 $f2, 64($sp)
lwc1 $f3, 68($sp)
lwc1 $f4, 72($sp)
lwc1 $f5, 76($sp)
lwc1 $f6, 80($sp)
lwc1 $f7, 84($sp)
lwc1 $f8, 88($sp)
lwc1 $f9, 92($sp)
lwc1 $f20, 96($sp)
lw $s0, 100($sp)
lw $ra, 104($sp)
addi $sp, $sp, 112
L43: move $t0, $v0
L44: addi $sp, $sp, -8
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
L45: jr $ra

