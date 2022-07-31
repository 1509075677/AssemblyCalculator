.globl main
#XXAAXX783908782388289038339A do not modify or duplicate this line

.data 0x10000900
    .asciiz "993893843999+03981897"         # modifiable
.data 0x10000920
    .asciiz "912419-123457897"             # modifiable


.text
main:
    lui $a0, 0x1000 
    addi $a0, $a0, 0x0900 
    jal findOperator
    add $0,$0,$0  # set a breakpoint on this line and check your results

    lui $a0, 0x1000 
    addi $a0, $a0, 0x0920 
    jal findOperator
    add $0,$0,$0  # set a breakpoint on this line and check your results

    addi $v0, $0, 10
    syscall

# modifications above this line will be ignored on autograder
#XXAAXX783908782388289038339B do not modify or duplicate this line


# your code begins here
findOperator:
	move $t0 ,$zero
	addi $a0, $a0, 1
loop:
	lbu $t1 0($a0)
	beqz $t1, End
	bne $t1, 0x2B, subtract
	add $v1, $zero, 0x2B
	addi $v0, $t0, 1
	jr $ra
subtract:
	bne $t1, 0x2D, multi
	add $v1, $zero, 0x2D
	addi $v0, $t0, 1
	jr $ra
multi:
	bne $t1, 0x2A, Else
	add $v1, $zero, 0x2A
	addi $v0, $t0, 1
	jr $ra
Else:
	addi $t0, $t0, 1
	addi $a0, $a0, 1
	j loop
End:
	addi $v1, $zero,-1
	addi $v0, $zero,-1
	jr $ra




#.data 0x10010000  # uncomment this line 
# your data goes here