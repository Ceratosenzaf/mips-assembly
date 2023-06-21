.globl main
.text
main: 
	li $v0 5			# leggo numero da std 
	syscall
	
	li $t0 2
	div $v0 $t0
	mfhi $t1 			# $t1 = $v0 % $t0 = $v0 % 2
	beqz $t1 pari
	
dispari:
	addi $v0 $v0 1
	j stampa
pari:  
	addi $v0 $v0 2
	
stampa:
	move $a0 $v0
	li $v0 1
	syscall
	
	li $v0 10
	syscall