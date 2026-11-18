
# Listing 5 - count_pass
# count_pass(addr = $a0, n = $a1, mark = $a2)
# returns number of words >= mark in $v0
count_pass:
    addi $v0, $zero, 0       # count = 0
    addi $t0, $zero, 0       # i = 0
cp_loop:
    # >>> leave the loop (go to cp_end) when i >= n
    slt  $t1, $t0, $a1
    beq  $t1, $zero, cp_end
    # >>> $t3 = element i (its address is $a0 + 4 * i)
    sll  $t2, $t0, 2
    add  $t2, $a0, $t2
    lw   $t3, 0($t2)
    # >>> if $t3 >= mark, count = count + 1
    slt  $t4, $t3, $a2
    bne  $t4, $zero, cp_next
    addi $v0, $v0, 1
cp_next:
    addi $t0, $t0, 1         # i = i + 1
    j    cp_loop
cp_end:
    jr   $ra
