.data
str: .asciiz "abracadabra"
.align 2
letter: .asciiz "a"
output: .asciiz " occurrencies = "

.globl main

.text
main:
	la $a0 str
	la $a1 letter
	jal findOccurr
	move $s0 $v0
	
	la $a0 str
	li $v0 4			
	syscall
	la $a0 output		# print result
	li $v0 4			
	syscall
	move $a0 $s0
	li $v0 1
	syscall	
	
	li $v0 10
	syscall	

# a0 = address of string
# a1 = address of letter to find
# v0 = found occurrencies
findOccurr:
	move $t0 $fp
	addiu $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	addiu $sp $fp -12

	lb $t0 ($a0)
	lb $t1 ($a1)
	
	beqz $t0 baseCase
	beq $t0 $t1 add1
	bne $t0 $t1 add0

add1:
	li $s0 1
	j continue
	
add0: 
	li $s0 0
	j continue

continue:
	addiu $a0 $a0 1
	jal findOccurr
	addu $v0 $s0 $v0
	
	j return	
	
baseCase:
	li $v0 0	
	
return:
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	move $fp $t0
	
	jr $ra

