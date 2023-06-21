.globl main
.text
main:
	li $v0 5
	syscall
	move $s0 $v0	# s0 = max
	li $s1 0		# s1 = index
	li $s2 0		# s2 = sum
	
ciclo:
	addi $s1 $s1 1
	bgt $s1 $s0 stampa
	mult $s1 $s1
	mflo $t1 		# t1 = s1^2
	add $s2 $s2 $t1 
	j ciclo
	
stampa:  
	li $v0 1
	move $a0 $s2
	syscall

fine:
	li $v0 10
	syscall