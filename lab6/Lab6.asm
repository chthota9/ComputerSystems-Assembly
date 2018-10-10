# Charishma Thota
# cthota@ucsc.edu
# 03/09/18
# Lab 6: VIGNERE CIPHER
# 01J, Eshan Hemmati 

# PsuedoCode:
#	EncryptChar: 
# 		if (lowercase)
#			go to lowercase branch
#		else
#			got to uppercase
#		uppercase:
#			sub 65 to both input and key
#			add the two numbers to get digit value store as variable in t register
#			if ($t > 25)
#				sub 26
#				add 65
#			else
#				add 65
#			exit
#	
#		lowercase:
#			sub 97 to input
#			sub 65 to key (key is always uppercase)
#			add the two numbers together
#			if ($t > 25)
#				sub 26
#				add 97
#			else
#				add 97
#			exit
#		exit:
#			jr $ra
#	EncryptString:
#			store addresses into s registers
#			store addresses into t registers (to pass through)
#		loadbyte loop:
#			load bytes from t registers of input and key strings
#		
#				if ($a1 = 0)
#					reset key to start by using s registers
#				if ($a0 <= 64)
#					its a punct, go to punct
#				if( $a0 =>91)
#					set flag to 1
#					go to check96
#				else if ($a0 >122)
#					set flag3 to 1
#					go to check 127
#				check96:
#					if( $a0 <= 96)
#						set flag2 to 1
#						if AND of flag and flag 2 == 1)
#							its a character we dont want
#							input = input + 1
#							output = output + 1
#							go back to start of loop
#				check 127:
#					if ($a0 <= 127)
#						set flag4 to 1
#						if AND of flag3 and flag 1 == 1)
#							its a character we dont want
#							input = input + 1
#							output = output + 1
#							go back to start of loop
#				punct: 
#					print punct
#					input = input +1
#					output= output + 1 #DONT INCREMENT KEY
#					increment $t register that holds the counter of the 30 character limit
#					if($t == 30)
#						exit
#					if all these conditions fail
#						its a character we want
#						if ($a0 == 0) #reached the end
#							exit
#						call EncryptChar
#						move output into v register to print
#						save return address
#						input = input +1
#						key = key +1
#						output= output + 1 #DONT INCREMENT KEY
#						increment $t register that holds the counter of the 30 character limit
#						if($t == 30)
#						exit
#		
#				exit:
#					$jr ra
#	DecrpytChar:
#			if (lowercase)
#			go to lowercase branch
#		else
#			got to uppercase
#		uppercase:
#			sub 65 to both input and key
#			sub the two numbers to get digit value store as variable in t register
#			if ($t < 0)
#				add 26
#				add 65
#			else
#				add 65
#			exit
#		lowercase:
#			sub 97 to input
#			sub 65 to key (key is always uppercase)
#			add the two numbers together
#			if ($t > 25)
#				add 26
#				add 97
#			else
#				add 97
#			exit
#		exit:
#			jr $ra
#	
#	DecryptString:
#			store addresses into s registers
#			store addresses into t registers (to pass through)
#		loadbyte loop:
#			load bytes from t registers of input and key strings
#		
#				if ($a1 = 0)
#					reset key to start by using s registers
#				if ($a0 <= 64)
#					its a punct, go to punct
#				if( $a0 =>91)
#					set flag to 1
#					go to check96
#				else if ($a0 >122)
#					set flag3 to 1
#					go to check 127
#				check96:
#					if( $a0 <= 96)
#						set flag2 to 1
#						if AND of flag and flag 2 == 1)
#							its a character we dont want
#							input = input + 1
#							output = output + 1
#							go back to start of loop
#				check 127:
#					if ($a0 <= 127)
#						set flag4 to 1
#						if AND of flag3 and flag 1 == 1)
#							its a character we dont want
#							input = input + 1
#							output = output + 1
#							go back to start of loop
#				punct: 
#					print punct
#					input = input +1
#					output= output + 1 #DONT INCREMENT KEY
#					increment $t register that holds the counter of the 30 character limit
#					if($t == 30)
#						exit
#					if all these conditions fail
#						its a character we want
#						if ($a0 == 0) #reached the end
#							exit
#						call DecryptChar
#						move output into v register to print
#						save return address
#						input = input +1
#						key = key +1
#						output= output + 1 #DONT INCREMENT KEY
#						increment $t register that holds the counter of the 30 character limit
#						if($t == 30)
#						exit
#		
#				exit:
#					$jr ra


# CODE STARTS HERE-------------------------------------------------
# Subroutine EncryptChar
# Encrypts a single character using a single key character.
# input: $a0 = ASCII character to encrypt
#	 $a1 = key ASCII character
# output: $v0 = Vignere-encrypted ASCII character
# Side effects: None
# Notes: Plain and cipher will be in alphabet A-Z or a-z key will be in A-Z

EncryptChar:	
	bge $a0, 97, __Lower_Case 	# if the number is greater than 97, the lowercase
	
__Upper_Case:
	add $t0, $a0, -65	# add -65 to change ASCII value to digit value
	add $t1, $a1, -65 	# add -65 to change ASCII value to digit value
	
	add $t2, $t0, $t1 	# add the two numbers to get the digit value of encrypted ASCII character
	
	bgt $t2, 25, __sub26	# if the sum is greater than 25, you have to subtract 26
	b __skip_subb		# if not skip the subtracting portion
	
	__sub26:
		sub $t2, $t2, 26	# this is needed to get the correct ASCII character
	__skip_subb:	
		add $t2, $t2, 65	# add 65 at the end to go back to ASCII value
		move $v0, $t2		# move the temporary register into v register to store the value
	b __end_Char			# exit the encryptChar subroutine
__Lower_Case:
	add $t0, $a0, -97 	# add -97 to change ASCII value to digit value
	add $t1, $a1, -65	# add -65 to change ASCII value to digit value (KEY will always be upper case)
	
	add $t2, $t0, $t1	# add the two numbers to get the digit value of encrypted ASCII character
	
	bgt $t2, 25, __subb26	# if the sum is greater than 25, you have to subtract 26
	b __skip_subb2		# if not skip the subtracting portion
	
	__subb26:		
		sub $t2, $t2, 26	# this is needed to get the correct ASCII character
	__skip_subb2:	
		add $t2, $t2, 97 	# add 97 at the end to go back to ASCII value
		move $v0, $t2		# move the temporary register into v register to store the value
__end_Char:				# exit the encryptChar subroutine
	jr $ra
	
# Subroutine EncryptString
# 	Encrypts a null-terminated string of length 30 or less,
# 	using a keystring.
# input:$a0 = Address of plaintext string
#	$a1 = Address of key string
#	$a2 = Address to store ciphertext string
# output: None
# Side effects: String at $a2 will be changed to the
#		Vignere-encrypted ciphertext.
#		$a0, $a1, and $a2 may be altered

EncryptString:
li $t8, 0
	move $s0, $a0		# move the address of the input string into a saved register
	move $s1, $a1		# move the address of the key string into a saved register
	
	move $t3, $a0		# move the address of the input string into a temporary register
	move $t4, $a1		# move the address of the key string into a temporary register
				# this way we can alter whats in the a registers
	__main_char_loop:
		lb $a0, ($t3)	# load the byte found at $t3
		lb $a1, ($t4)	# load the byte found at $t4
		
		
		beqz $a1, __Reset	# if key string is too short reset the string back to beginning
		
		
		ble $a0, 64, __punct 	# if the string contains any punct
		bge $a0, 91, __set_Flag1  # checks for 91 - 96
		
		__condition2:			# checks for 123-127
			bge $a0, 123, __set_Flag3
			b __continue_String
		__Flag:
			ble $a0, 96 __set_Flag2 # checks for 91-96
			b __condition2
		__Flag2:
			ble $a0, 127, __set_Flag4 #checks for 123-127
			b __continue_String
		__check_Flag:
			and $t7, $t5, $t6	# and returns true if both registers are set to true
			beq $t7, 1, __punct	# proceed to punct branch
		__continue_String:	
		bge $a0, 65, __inner_char_loop # if its not a punct, after checking all the conditions it has to be >= 65
		
		
		
		__set_Flag1:		# sets a 1 if greater or equal to 91
			li $t5, 1
			b __Flag
		__set_Flag2:		# sets a 1 if less than or equal to 96
			li $t6, 1
			b __check_Flag
		__set_Flag3:		# sets a 1 if greater than or equal to 123
			li $t5, 1
			b __Flag2
		__set_Flag4:		# sets a 1 if less than or equal to 127
			li $t6, 1
			b __check_Flag
		
		__punct:
			sw $ra, ($sp)		# store stack pointer
			subi $sp, $sp, 4	# subtract stack pointer by 4, to access
			beqz $a0, __exit	# if you reach the end of input string, exit
			sb $a0, ($a2)		# store the output to print out
			addi $sp, $sp, 4	# update
			lw $ra, ($sp)		# for return address
			
			addiu $t3, $t3, 1	#increment input
			addiu $a2, $a2, 1	# increment output 
			addi $t8, $t8, 1 	# program counter to keep track of 30 character limit
			beq $t8, 30, __EXIT	# if it reaches 30 go to exit
			j __main_char_loop	# else go back to beg of the loop, load next
		
		__inner_char_loop:
			sw $ra, ($sp)		
			subi $sp, $sp, 4	# to access
			beqz $a0, __exit	# if you reach the end of the input string, exit
			jal EncryptChar		# call encryptchar on the char you are on
			sb $v0, ($a2)		# move to print out
			addi $sp, $sp, 4	#update
			lw $ra, ($sp)		#correct return address
			b __increment		# go to increment 
					
			__Reset:
				move $t4, $s1	# move orginal stored value into $t4 to set the key back to the first char
				j __main_char_loop	# go back to start of loop, load next byte
				
			__increment:
				addiu $t3, $t3, 1 	#increment input
				addiu $t4, $t4, 1	#increment key
				addiu $a2, $a2, 1	#increment output
				addi $t8, $t8, 1 # program counter
				beq $t8, 30, __EXIT	#if it reachese 30 exit
			
				j __main_char_loop	#else go back to start of the loop, load next byte
__exit:
	addi $sp, $sp, 4 #makes sure to add 4 more so the program does not print out output twice
__EXIT:
jr $ra				# retrun correctly with the right address

# Subroutine DecryptChar
# Decrypts a single character using a single key character.
# input: $a0 = ASCII character to encrypt
#	 $a1 = key ASCII character	 
# output: $v0 = Vignere-encrypted ASCII character
# Side effects: None
# Notes: Plain and cipher will be in alphabet A-Z or a-z # key will be in A-Z

DecryptChar:
	bge $a0, 97, __Lower_Case2 	# if the number is greater than 97, the lowercase
	
__Upper_Case2:
	add $t0, $a0, -65	# add -65 to change ASCII value to digit value
	add $t1, $a1, -65 	# add -65 to change ASCII value to digit value
	
	sub $t2, $t0, $t1 	# sub the two numbers to get the digit value of decrypted ASCII character
	
	blt $t2, 0, __Add26	# if the diff is less than 0, you have to add 26
	b __skip_add		# if not skip the adding portion
	
	__Add26:
		add $t2, $t2, 26	# this is needed to get the correct ASCII character
	__skip_add:	
		add $t2, $t2, 65	# add 65 at the end to go back to ASCII value
		move $v0, $t2		# move the temporary register into v register to store the value
	b __end_Char2			# exit the encryptChar subroutine
__Lower_Case2:
	add $t0, $a0, -97 	# add -97 to change ASCII value to digit value
	add $t1, $a1, -65	# add -65 to change ASCII value to digit value (KEy will always be upper case)
	
	sub $t2, $t0, $t1	# sub the two numbers to get the digit value of encrypted ASCII character
	
	blt $t2, 0, __add26	# if the diff is less than 0, you have to add 26
	b __skip_add2		# if not skip the adding portion
	
	__add26:		
		add $t2, $t2, 26	# this is needed to get the correct ASCII character
	__skip_add2:	
		add $t2, $t2, 97 	# add 97 at the end to go back to ASCII value
		move $v0, $t2		# move the temporary register into v register to store the value
__end_Char2:				# exit the encryptChar subroutine
	jr $ra
# Subroutine DecryptString
# Encrypts a null-terminated string of length 30 or less, # using a keystring.
# input: $a0 = Address of ciphertext string
#	$a1 = Address of key string
#	$a2 = Address to store plaintext string
# output: None
# Side effects: String at $a2 will be changed to the
#		Vignere-decrypted plaintext
#		$a0, $a1, and $a2 may be altered
DecryptString:
li $t8, 0
	move $s0, $a0		# move the address of the input string into a saved register
	move $s1, $a1		# move the address of the key string into a saved register
	
	move $t3, $a0		# move the address of the input string into a temporary register
	move $t4, $a1		# move the address of the key string into a temporary register
				# this way we can alter whats in the a registers
	__main_char_loop2:
		lb $a0, ($t3)	# load the byte found at $t3
		lb $a1, ($t4)	# load the byte found at $t4
		
		
		beqz $a1, __Reset2	# if key string is too short reset the string back to beginning
		
		
		ble $a0, 64, __punct2 	# if the string contains any punct
		bge $a0, 91, __set_flag1  # checks for 91 - 96
		
		__Condition2:			# checks for 123-127
			bge $a0, 123, __set_flag3
			b __continue_String2
		__flag:
			ble $a0, 96 __set_flag2 # checks for 91-96
			b __Condition2
		__flag2:
			ble $a0, 127, __set_flag4 #checks for 123-127
			b __continue_String2
		__check_Flag2:
			and $t7, $t5, $t6	# and returns true if both registers are set to true
			beq $t7, 1, __punct2	# proceed to punct branch
		__continue_String2:	
		bge $a0, 65, __inner_char_loop2 # if its not a punct, after checking all the conditions it has to be >= 65
		
		
		
		__set_flag1:		# sets a 1 if greater or equal to 91
			li $t5, 1
			b __flag
		__set_flag2:		# sets a 1 if less than or equal to 96
			li $t6, 1
			b __check_Flag2
		__set_flag3:		# sets a 1 if greater than or equal to 123
			li $t5, 1
			b __flag2
		__set_flag4:		# sets a 1 if less than or equal to 127
			li $t6, 1
			b __check_Flag2
		
		__punct2:
			sw $ra, ($sp)		# store stack pointer
			subi $sp, $sp, 4	# subtract stack pointer by 4, for accessing
			beqz $a0, __exit2	# if you reach the end of input string, exit
			sb $a0, ($a2)		# store the output to print out
			addi $sp, $sp, 4	#update
			lw $ra, ($sp)		# correct return address
			
			addiu $t3, $t3, 1	#increment input
			addiu $a2, $a2, 1	#increment output
			addi $t8, $t8, 1	# program counter to keep track of 30 character limit
			beq $t8, 30, __EXIT2	# if it reaches 30, exit 
			j __main_char_loop2	#else go back to start of the loop, load next byte
		
		__inner_char_loop2:
			sw $ra, ($sp)
			subi $sp, $sp, 4	# access the stack
			beqz $a0, __exit2	# if you reach the end of the input string, exit
			jal DecryptChar		#call decrypt char
			sb $v0, ($a2)		# store to print out output
			addi $sp, $sp, 4	# update stack
			lw $ra, ($sp)		# correct return address
			b __increment2		#go to increment
					
			__Reset2:
				move $t4, $s1		#move orginal stored value into $t4 to set the key back to the first char
				j __main_char_loop2	# go back to start of loop, load next byte
				
			__increment2:
				addiu $t3, $t3, 1	#increment input
				addiu $t4, $t4, 1	#increment key
				addiu $a2, $a2, 1	#increment output
				addi $t8, $t8, 1 # program counter
				beq $t8, 30, __EXIT2	#if it reachese 30 exit
			
				j __main_char_loop2	#else go back to start of the loop, load next byte
__exit2:
	addi $sp, $sp, 4
__EXIT2:
jr $ra
	

	
	
