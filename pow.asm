# pow.asm program
#

# C++ (NON-RECURSIVE) code snippet of pow(x,n):
#   int x, n, pow=1; 
#   cout << "Enter a number x:\n"; 
#   cin >> x;
#   cout << "Enter the exponent n:\n"; 
#   cin >> n; 
#   for (int i = 1; i <= n; i++) { 
#   	pow = pow * x; 
#   } 
#   cout << "Power(x,n) is:\n" << pow << "\n";
#
# Assembly (NON-RECURSIVE) code version of pow(x,n):
#
.data

	# TODO: Write your initializations here
	prompt1: .asciiz "Enter a number x:\n"
	prompt2: .asciiz "Enter the exponent n:\n"
    end1: .asciiz "Power(x,n) is:\n"
    end2: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
    #number
    li $v0, 4      
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    #exponent
    li $v0, 4      
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

	#initialize i
	li $t2, 0

	#declare pow
	li $t3, 1

loop:
	beq $t2, $t1, loop_exit
    mult $t3, $t0
    mflo $t3
    addiu $t2, 1
    j loop

loop_exit:
    li $v0, 4      
    la $a0, end1
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, end2
    syscall

    j exit

exit:
	li $v0, 10
    syscall
