#Charishma Thota
#cthota@ucsc.edu
#02/16/18
#Lab 4: DEADBEEF in Mips
#01J, Eshan Hemmati 
# Finds if a number is divisble by 4,9, or both up until a number inputed by the user

.text # Define the program instructions.
main: # Label to define the main program.
	li $v0,4 		# Load 4 into $v0 for the print string
	la $a0, prompt	 	# Load the address of the print string into $a0
	syscall 		# Print's "Please enter a number: "
				
	li $v0, 5		# Reads the integer that the user inputs
	syscall
 	move $s0, $v0 		# Stores the  user inputted integer into $s0
 		
 	move $t0, $s0		# move the stored integer and store into the max value loop runs until
 	add $t6, $t0, 1		# adds one so the loop runs 1 less
 	li $t1, 1		# start the loop counter
 	li $t2, 4		# load the value 4 
 	li $t3, 9		# load the value 9
 	
 	loop:
 		
 		rem $t4, $t1, $t2	# divide by 4 and stores remainder in $t4
 		rem $t5, $t1, $t3	# divide by 9 and stores remainder in $t5
 		or  $t7, $t4, $t5	# and will be 0 if both are remainder 0
 			
 		beqz $t7, DEADBEEF 	# checks if $t7 is 0, if so number is divisble by both 4 and 9
 		beqz $t4, DEAD 		# checkes if $t4 is 0, if so number is divisble by 4
 		beqz $t5, BEEF		# checkes if $t5 is 0, if so number is divisble by 9
 		bnez $t4, Number	# checks if $t4 != 0 if the remainder was not 0, it is not divisble by 4
 		bnez $t5, Number	# checks if $t5 != 0 if the remainder was not 0, it is not divisble by 9
 		
 		Number:
 		li $v0, 1		# loads in order to print
 		move $a0, $t1		# moves the number to print
 		syscall
 		
 		add $t1, $t1, 1		# adds 1 to the iterator
 		beq $t1, $t6, end	# checks if the iterator has reached the "user input + 1" value, if so 
 					# go to the end, if not print a new line
 		
 		li $v0, 4		#prints out a new line
 		la $a0, newline
 		syscall	
 		
 		j	loop		#jumps to the start of the loop
 		
 		DEAD: 			
 		li $v0, 4		# loads in order to print
 		la $a0, out1		# prints DEAD
 		syscall	
 		
 		add $t1, $t1, 1		# adds 1 to the iterator
 		beq $t1, $t6, end	# checks if the iterator has reached the "user input + 1" value, if so 
 					# go to the end, if not print a new line
 		
 		li $v0, 4		#prints out a new line
 		la $a0, newline	
 		syscall	
 		
 		j	loop		#jumps to the start of the loop
 		
 		BEEF:
 		li $v0, 4		# loads in order to print
 		la $a0, out2		# prints BEEF
 		syscall	
 		
 		add $t1, $t1, 1		# adds 1 to the iterator
 		beq $t1, $t6, end	# checks if the iterator has reached the "user input + 1" value, if so 
 					# go to the end, if not print a new line
 		
 		
 		li $v0, 4		#prints out a new line
 		la $a0, newline
 		syscall	
 		
 		j	loop		#jumps to the start of the loop
 		
 		DEADBEEF:
 		li $v0, 4		# loads in order to print
 		la $a0, out3		# prints DEADBEEF
 		syscall	
 		
 		add $t1, $t1, 1		# adds 1 to the iterator
 		beq $t1, $t6, end	# checks if the iterator has reached the "user input + 1" value, if so 
 					# go to the end, if not print a new line
 		
 		li $v0, 4		#prints out a new line
 		la $a0, newline			
 		syscall	
 		
 		j	loop		#jumps to the start of the loop
 		
 	end:		
 				# Exit the program, end of the program
	li $v0, 10 		# Load a 10 into $v0, makes the program halt
 	syscall 		# The will end here
.data 				# Need to define the program data
newline: .asciiz "\n"
prompt: .asciiz "Pease enter a number N: " #The string to print.
out1:	.asciiz "DEAD"
out2:	.asciiz "BEEF"
out3:	.asciiz "DEADBEEF"
