#	## [s2.4] Semplice slotmachine con syscall
#	**WARNING : Questo sorgente è eseguibile solo con l'emulatore MARS**
#	*nome del file sorgente: slotmachine.asm*
#	Utilizzando le syscall rese disponibili dall'emulatore MARS implementare un programma che:
#	* Richieda all'utente attraverso una finestra di dialogo l'inserimento di un numero intero `NUM`
#	* Estragga un numero casuale `R` nel range `[-NUM,NUM]`, (il seed del generatore di numeri casuali può essere inizializzato con un qualsiasi numero intero)
#	* Sommi `R` al numero inserito `NUM` : `RESULT = NUM + R`
#	* Mostri all'utente attraverso una nuova finestra di dialogo il nuovo credito dell'utente dopo la scommessa (`RESULT`).

.data
input: .asciiz "insert a number "
output: .asciiz "\nyou now have "

.globl main

.text 
main:
	li $v0 51 
	la $a0 input
	syscall
	move $s0 $a0			# s0 = NUM
	
	li $v0 42				# generate random change
	li $a0 0
	sll $a1 $s0 1
	addiu $a1 $a1 1
	syscall
	
	move $s1 $a0	
	subu $s1 $s1 $s0		# s1 = change
	
	addu $s0 $s0 $s1		# s0 = new value
	
	li $v0 56 				# print new balance
	la $a0 output
	move $a1 $s0
	syscall
		
	li $v0 10
	syscall
