.globl main
#XXAAXX783908782388289038339A do not modify or duplicate this line

.text
main:
    lui $a0, 0x1000 
    addi $a0, $a0, 0x0300 # this line is modifiable
    jal getInput
    add $0,$0,$0  # set a breakpoint on this line and check your results
    
    lui $a0, 0x1000 
    addi $a0, $a0, 0x0400 # this line is modifiable
    jal getInput
    add $0,$0,$0  # set a breakpoint on this line and check your results
    
    lui $a0, 0x1000 
    addi $a0, $a0, 0x0500 # this line is modifiable
    jal getInput
    add $0,$0,$0  # set a breakpoint on this line and check your results

    addi $v0, $0, 10
    syscall

# modifications above this line will be ignored on autograder
#XXAAXX783908782388289038339B do not modify or duplicate this line

#your code begins here
getInput:
	add $t0,$a0,$zero
	la $a0, message1
	li $v0, 4
	syscall
	
	sub $a0, $a0, $a0
	add $a0, $zero, $t0
	li $v0, 8
	la $t0, resp
	sw $a0,0($t0)
	syscall

	jr $ra
	



.data 0x10010000  # uncomment this line 
# your data goes here
	resp: .space 15
	message1: .asciiz "\nEnter:\n"