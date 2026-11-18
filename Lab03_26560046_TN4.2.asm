
.data
    result: .asciiz "Result: "

.text
.globl main
main:
    li $a0, 1
    li $a1, 2
    li $a2, 3
    jal sum3
    move $t1, $v0
    li $v0, 4
    la $a0, result
    syscall
    move $a0, $t1
    li $v0, 1
    syscall
    li $v0, 10
    syscall
# Fix B: sum3 with $s0 saved on the stack
sum3:
    addi $sp, $sp, -4
    sw   $s0, 0($sp)
    add  $s0, $a0, $a1
    add  $v0, $s0, $a2
    lw   $s0, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
