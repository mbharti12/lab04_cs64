# min.asm program
#

.data
    prompt: .asciiz "Enter an integer:\n"
    end1: .asciiz "Minimum: "
    end2: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
    #first number
    li $v0, 4      
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    #second number
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    #third number
    li $v0, 4      
    la $a0, prompt
    syscall

    li $v0 ,5
    syscall
    move $t2, $v0

    blt $t0, $t1, first_less_than_second
    blt $t1, $t2, second_less_than_third
    j else

first_less_than_second:
    blt $t0, $t2, first_less_than_third

first_less_than_third:
    li $v0, 4      
    la $a0, end1
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4      
    la $a0, end2
    syscall

    j exit

second_less_than_third:
    li $v0, 4      
    la $a0, end1
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4      
    la $a0, end2
    syscall

    j exit

else:
    li $v0, 4      
    la $a0, end1
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4      
    la $a0, end2
    syscall    

    j exit

exit:
    li $v0, 10
    syscall
