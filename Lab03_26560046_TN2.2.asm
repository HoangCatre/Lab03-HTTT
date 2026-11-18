
# Listing 3 - clamp(x, lo, hi)

.text
.globl main

main:
    li   $v0, 5          # read an integer x into $v0
    syscall
    add  $a0, $v0, $zero # argument 1: x
    addi $a1, $zero, 0   # argument 2: lo = 0
    addi $a2, $zero, 100 # argument 3: hi = 100
    jal clamp
    add  $a0, $v0, $zero # print the result
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall
# clamp(x = $a0, lo = $a1, hi = $a2): returns x limited to [lo, hi]
clamp:
    # >>> if x < lo, the result is lo
    slt  $t0, $a0, $a1
    bne  $t0, $zero, return_lo
    # >>> else if hi < x, the result is hi
    slt  $t0, $a2, $a0
    bne  $t0, $zero, return_hi
    # >>> otherwise the result is x
    add  $v0, $a0, $zero
    jr   $ra
return_lo:
    add  $v0, $a1, $zero
    jr   $ra
return_hi:
    add  $v0, $a2, $zero
    jr   $ra
