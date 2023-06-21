#	## [s2.3.1] Spilling di registri
#	*nome del file sorgente: spilling2.asm*
#	Si supponga di poter usare soltanto i registri $s0 e $t0.
#	Si scriva il codice assembly che:
#	* calcoli la somma dei primi tre numeri interi positivi (1, 2 e 3), ciascuno moltiplicato per tre; 
#	* non si utilizzi la pseudo-istruzione mul.

.data
sum: 0

.globl main

.text
main:
	li $s0 3	
	li $t0 1
	mult $t0 $s0 
	mflo $s0
	lw $t0 sum
	addu $t0 $t0 $s0
	sw $t0 sum
	
	li $s0 3	
	li $t0 2
	mult $t0 $s0 
	mflo $s0
	lw $t0 sum
	addu $t0 $t0 $s0
	sw $t0 sum
	
	li $s0 3	
	li $t0 3
	mult $t0 $s0 
	mflo $s0
	lw $t0 sum
	addu $t0 $t0 $s0
	sw $t0 sum
	
	lw $s0 sum
	move $a0 $s0
	li $v0 1
	syscall

	li $v0 10
	syscall
