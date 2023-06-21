#	## [s2.1] Intero successivo
#	*nome del file sorgente: intsuccessivo.asm*
#	Si scriva codice assembly che:
#	* chieda all’utente di inserire un intero (messaggio su terminale);
#	* acquisisca un intero da terminale;
#	* calcoli l’intero successivo;
#	* mostri all’utente il risultato (messaggio su terminale).
.data
str: .asciiz "inserisci un numero "

.globl main

.text
main:
	li $v0 4
	la $a0 str
	syscall
	
	li $v0 5
	syscall
	
	addiu $s0 $v0 1
	
	li $v0 1
	move $a0 $s0
	syscall
	
	li $v0 10
	syscall