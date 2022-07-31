.globl main
#XXAAXX783908782388289038339A do not modify or duplicate this line
# For negative values the sign must increments $a1
# i.e.   for "-1234"     $a1 = 5

.data 0x10000900
    .ascii "999"         # modifiable - must also change line 23
.data 0x10000910
    .ascii "1239"         # modifiable - must also change line 31
    
.text
main:
    lui $a0, 0x1000 
    addi $a0, $a0, 0x0900 
    addi $a1, $0, 3    # modifable - must be the number of character in the number above
    jal AsciiToDec 
    add $0,$0,$0  # set a breakpoint on this line and check your results

    lui $a0, 0x1000 
    addi $a0, $a0, 0x0910 
    addi $a1, $0, 4    # modifable - must be the number of character in the number above
    jal AsciiToDec 
    add $0,$0,$0  # set a breakpoint on this line and check your results

    add $0,$0,$0  # set a breakpoint on this line and check your results

    addi $v0, $0, 10
    syscall

# modifications above this line will be ignored on autograder
#XXAAXX783908782388289038339B do not modify or duplicate this line



# your code begins here
AsciiToDec:
	addi $t0,$zero,10 #t0=10
	move $t1,$zero   #count=0
	addi $t1,$t1,1
	addi $t2,$zero,1  #t2=1
	move $t3,$zero	#count2=0
	move $v0,$zero  #v0=0
	move $t4,$zero
	lbu $t6,0($a0)
	j count
count:
	beq $t1,$a1,check
	mul $t2,$t0,$t2
	addi $t1,$t1,1 #count=count+1
	j count
check:
	bne $t6,0x2D,Not
	div $t2,$t2,$t0
	addi,$a0,$a0,1 #goes to next char
	addi $t3,$t3,1 #count2=count2+1
	j Neg
Not:
	beq $t3,$a1,End
	lbu $t5,0($a0)
	sub $t4,$t5,'0'
	mul $t4 $t4,$t2
	add $v0,$v0,$t4
	div $t2,$t2,$t0	#t2=t2/10
	addi $t3,$t3,1  #count2=count2+1
	addi $a0,$a0,1 	#goes to next char
	j Not
Neg:
	beq $t3,$a1,Sub
	lbu $t5,0($a0)
	sub $t4,$t5,'0'
	mul $t4 $t4,$t2
	add $v0,$v0,$t4
	div $t2,$t2,$t0
	addi $t3,$t3,1
	addi $a0,$a0,1
	j Neg
Sub:
	sub $v0,$zero,$v0
	j End

End:
	jr $ra


#.data 0x10010000  # uncomment this line 
# your data goes here