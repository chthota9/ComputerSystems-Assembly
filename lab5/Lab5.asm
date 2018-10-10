# Charishma Thota
# cthota@ucsc.edu
# 02/28/18
# Lab 5: DECIMAL TO BINARY CONVERTER
# 01J, Eshan Hemmati 
# Pseudocode:
	# Print out neccessary prompts
	# Load the word and  1st byte 
	# if(negative)
	#	goto negative 
	# else
	#	goto loop
	# negative:
	#	if (ASCII value = 45)
	#		set flag to 1
	#		increment address by 1 to check next byte
	# loop:
	#	check first byte
	#	Add by -48  //  ASCII value after 49 (which is '1') adding by -48 will give you digit representation
	#		print out the digits
	#	($s0 X 10) + the current digit you are on //creates running sum to store as integer into $s0
	#	increment address by 1
	# checkNeg:
	#	if(flag == 1)
	#		goto twos
	#	if(flag == 0)
	#		goto mask
	# twos:
	#	XOR to flip bits
	#	add 1
	#	goto mask
	# mask:
	#	print out neccessary prompts
	#	create inital mask by bit rotation
	# 	mask_loop: // loop around 32 times
	#		AND $s0 with mask
	#		if(ANDed number > 0)
	#			print "1"
	#		if(ANDed number == 0)
	#			print "0"
	#		shift mask logical right
	#		check if the loop has finished running 32 times (if the mask == 0)
	#			end program
.text
main:
# load immediates to all the registers used in this code
li $t3, 10 	#used to multiply the runnin number stored in $s0
li $s0, 0 	#stores the number as an integer, starts off at 0 to store the running sum
li $s1, 1	#used to bit rotate to create the inital mask (since ...0000001 will become 100000....)
li $s2, 0	#stores the mask
li $s3, 0	#stores the resulting AND of the mask and the number stored in #s0
li $s4, 0	#prints 0 if the resulting AND is 0
li $s5, 1	#prints 1 if the resulting AND is greater than 1, because that means the masking returned a 1 somewhere
li $t4, 45	#used to check for negative number since ASCII value is 45

	li $v0,4 		# Load 4 into $v0 for the print string
	la $a0, prompt	 	# Load the address of the print string into $a0
	syscall 		# Print's "User input number: "
	
	li $v0, 4		#prints out a new line
 	la $a0, newline		# Load the address of the print string into $a0
 	syscall			# Prints a new line
 	
		lw $t1, ($a1)	#loads word so basically the character at the address
		lb $t2, ($t1) 	#loads the first byte into the register (this is to check if its negative or not)
		beq $t2, $t4, negative		#if it equals 45, then it is negative (jump to negative)
		bne $t2, $t4, print_Digit	#if not then jump to loop, and proceed as positive number	
		
	negative:			#sets flag to 1 if ASCII value of first byte was 45
		li $t5, 1 		#number is negative, set flag as 1
			li $v0, 11		#prints out the "-" character	
			move $a0, $t2		#move the value in $t2 to print out
			syscall			#prints out the ASCII character "-"
		add $t1, $t1, 1		#adds 1 to the address
		j print_Digit		#jump back to the loop
		
	print_Digit:			#prints out all the digits of user inputted number and stores integer in $s0
		lb $t2, ($t1)		#loads the first byte into the register
		beqz $t2, checkNeg	#null character ASCII value is 0, so jump to checkNeg to check the sign
		addiu $t2, $t2, -48	#if you add -48 to the number you get the digits
		
		li $v0, 1		#syscall to print out integer
		move $a0, $t2		#move the value to $a0
		syscall			#will print out the user inputed numbers
						
		mul $s0, $s0, $t3	# $s0 times 10, $s0 will contain the running sum
		addu $s0, $s0, $t2	#add the current digit you are at on the user inputed number
					#eventually it will add up to the user inputted numeber
		
		add $t1, $t1, 1		# adds 1 to the address to get the next byte
 		j	print_Digit
 	checkNeg:			#checks if the number is negative or not
 		bnez $t5,twos		#if the flag is 1 (!=0), the number is negative so take 2SCs
 		beqz $t5, mask		#if equal to 0, proceed to do the bit masking portion
 	twos:				#takes 2SC by xor and adding 1
 		xori $s0, $s0, -1 	#xor will flip all the bits because xor any number by 1 will give u the opposite of the number
 		addu $s0, $s0, 1	#add one, as if you would do when taking 2SC representation, store 2SC in $s0
 		j mask			#then jump to bit masking with 2SC storeed in $s0
 	
	mask:				#create initial mask
		#need a new line after program prints the decimal verision
		li $v0, 4		#prints out a new line
 		la $a0, newline		#Load the address of the print string into $a0
 		syscall			#Prints a new line
 		#load the prompt for binary 
 		li $v0,4 		# Load 4 into $v0 for the print string
		la $a0, prompt2	 	# Load the address of the print string into $a0
		syscall 		# Print's "Please enter a number: "
		#print new line to print out the binary representation
		li $v0, 4		#prints out a new line
 		la $a0, newline		#Load the address of the print string into $a0
 		syscall			#Prints a new line
 	
 		
		ror $s2, $s1, 1		#rotate to the right create the inital mask (since ...0000001 will become 100000....)
		mask_loop:		#masking loop to get the binary conversion (runs 32 times)
						#$s3 stores the ANDed number, 
			and $s3, $s2, $s0	#AND the mask with number stored in $s0, whenever 1's are aligned the AND will return 1
				beqz $s3, printZero	#if $s3 equals 0, then there wasn't a 1 bit in $s0 in the same position there was a 1 in the mask
				bnez $s3, printOne	#if it doesnt equal 0, the 1's were aligned so we know there is a 1 in that position in the binary converted number
		printZero:			#prints 0 bit
			
			li $v0, 1		#syscall to print out integer
			move $a0, $s4		# moves the value 0 into $a0
			syscall			#prints out 0
			
			srl $s2, $s2, 1		#logical shift to the right to change the position of 1 in the mask
			beqz $s2, end		# if the digit falls off after shifting right, value will equal 0
			j mask_loop		# jump back to mask loop to run in total of 32 times
			
		printOne:
			li $v0, 1		#syscall to print out integer
			move $a0, $s5		#moves the value 1 into $a0
			syscall			#prints out 1
			
			srl $s2, $s2, 1		#logical shift to the right to change the position of 1 in the mask
			beqz $s2, end		#if the digit falls off after shifting right, value will equal 0
			j mask_loop		#jump back to mask loop to run in total of 32 times
		
end:	
 				# Exit the program, end of the program
	li $v0, 10 		# Load a 10 into $v0, makes the program halt
 	syscall 		# The program will end here
 	
.data 	
prompt: .asciiz "User input number: " #The string to print.
prompt2: .asciiz "This number in binary is:"
newline: .asciiz "\n"
