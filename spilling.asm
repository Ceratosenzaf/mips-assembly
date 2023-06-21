#	## [s2.3] Spilling di registri
#	*nome del file sorgente: spilling.asm*
#	Si supponga di poter usare soltanto i registri $s0 e $t0.
#	Si scriva il codice assembly che:
#	* calcoli la somma dei primi tre numeri interi positivi (1, 2 e 3), ciascuno al quadrato; 
#	* non si utilizzi la pseudo-istruzione mul.

.globl main

.text
main:
	li $s0 0
	
	li $t0 1
	mult $t0 $t0 
	mflo $t0
	addu $s0 $s0 $t0
	
	li $t0 2
	mult $t0 $t0 
	mflo $t0
	addu $s0 $s0 $t0
	
	li $t0 3
	mult $t0 $t0 
	mflo $t0
	addu $s0 $s0 $t0
	
	move $a0 $s0
	li $v0 1
	syscall

	li $v0 10
	syscall
