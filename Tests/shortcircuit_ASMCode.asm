.data
newline: .asciiz "\n"
.text
.globl main
isodd:
L2: move $t0, $a0
L3: addi $sp, $sp, -8
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
L4: move $t0, $a0
L5: li $t1, 2
L6: div $t0, $t1
mfhi $t2
L7: move $v0, $t2
jr $ra
L8: jr $ra

main:
L10: li $t0, 2
L11: addi $sp, $sp, -108
sw $a0, ($sp)
move $a0, $t0
L12: sw $a1, 4($sp)
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
jal isodd
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
L13: move $t0, $v0
L14: li $t1, 3
L15: addi $sp, $sp, -108
sw $a0, ($sp)
move $a0, $t1
L16: sw $a1, 4($sp)
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
jal isodd
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
L17: move $t1, $v0
L18: li $t2, 0
L19: li $s0, 0
sub $s0, $t0, $s0
     beqz $s0, L22
L20: li $t2, 1
L21: b L32
L22: li $s0, 0
sub $s0, $t1, $s0
     beqz $s0, L25
L23: li $t2, 1
L24: b L32
L25: li $t0, 4
L26: addi $sp, $sp, -108
sw $a0, ($sp)
move $a0, $t0
L27: sw $a1, 4($sp)
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
jal isodd
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
L28: move $t0, $v0
L29: li $s0, 0
sub $s0, $t0, $s0
     beqz $s0, L32
L30: li $t2, 1
L31: b L32
L32: li $s0, 0
sub $s0, $t2, $s0
     beqz $s0, L35
L33: li $t0, 100
L34: addi $sp, $sp, -8
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
L35: jr $ra

