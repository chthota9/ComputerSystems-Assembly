Charishma Thota
cthota@ucsc.edu
02/28/18
Lab 5: DECIMAL TO BINARY CONVERTER
01J, Eshan Hemmati 

Magic Number: 0b1010, 0x1224, 0x0745

PsuedoCode:
     Print out neccessary prompts
	 Load the word and  1st byte 
	 if(negative)
		goto negative 
	 else
		goto loop
	 negative:
		if (ASCII value = 45)
			set flag to 1
			increment address by 1 to check next byte
	 loop:
		check first byte
		Add by -48  //  ASCII value after 49 (which is '1') adding by -48 will give you digit representation
			print out the digits
		($s0 X 10) + the current digit you are on //creates running sum to store as integer into $s0
		increment address by 1
	 checkNeg:
		if(flag == 1)
			goto twos
		if(flag == 0)
			goto mask
	 twos:
		XOR to flip bits
		add 1
		goto mask
	 mask:
		print out neccessary prompts
		create inital mask by bit rotation
	 	mask_loop: // loop around 32 times
			AND $s0 with mask
			if(ANDed number > 0)
				print "1"
			if(ANDed number == 0)
				print "0"
			shift mask logical right
			check if the loop has finished running 32 times (if the mask == 0)
				end program
Questions:
Describe What You Learned:
    I learned how to understand how to code in MIPS a lot better than Lab4. This is probably because this Lab
    required more complex code structures. While using these structures, I was able to become more comfortable 
    with using this language compared to the previous lab. For instance, branch jumping, loops and if statements 
    became more clear and understanable.
What Was Surprised:
    I was surpised on how all the adress and memory access worked in MIPS. It was very interesting to see how the
    addresses were stored when we using the program argument line instead of reading the integer. In this program
    we were accessing the address of the user inputted integer.
What Worked Well:
    Converting to binary, for example the code for masking and 2SC, was fairly simple. Finding and using the concepts
    on how masking was very easy to understand simply by drawing everything out. It became clear on how masking works 
    and the logic behind the the bits it returns by ANDed it with the stored integer in $s0. Realizing that if the 1's 
    align in the mask and in the $s0 the AND will return 1 (since both are true), so that means the number returned is
    guaranteed to be greater or equal to 1, so you can just print out a "1" bit. Similary, if the 1's don't align the 
    number it returns has to be 0 so this means you can just print out a "0" bit. For 2SC, I realized I flipped all my 
    bits using XOR gates in Lab3, so I used the same logic here by XORing $s0 with all 1's (Since XORin anything with 1
    returns the opposite of it). Then I proceeded to add. This part of the lab was fairly easy to implement.
What Did Not:
    What did not work well is understanding how to access the user inputted ineteger from an address. This concept was 
    hard to grasp over, but after reading on it and trail and error over my code, the concept of accessing the address 
    became clear.
What happens if the user inputs a number that is too large to fit in a 32-bit 2SC number? :
    If the user inputs a number that is too large to fit, the program will return 32 bits of 0. However, what is really 
    happening is an "overflow". Since, there aren't enough bits to represent this number. Therefore technically it is 
    being representing in the low level, but when it prints out it prints out all the 0's that fit in that 32 bit range
What happens if the user inputs a number that is too small (large magnitude, but negative) to fit
in a 32-bit 2SC number? :
    Similary as above, the same output occurs. Since there aren;t enough bits to represent, it shows all the 0's that
    fit into the 32 bit range. 
What is the difference between the “mult” and the “multu” instructions? Which one did you
use, and why? :
    mult multplies two numbers normally, whereas multu does multiplication unsigned. This means that when you 
    do unsigned the "overflow" will get accounted for. I would use multu to account for the -2^31 case. This way,
    this number will print out correctly. However, in this lab I used mul because it made my code muche easier but 
    accounted for overflows by using addu or addiu.
Consider how you might write a binary-to-decimal converter, in which the user inputs a string of
ASCII “0”s and “1”s and your code prints an equivalent decimal string. How would you write your
code? How is the BDC like the DBC, and how is it different? :
    First, I would subtract by 48 or add by -48 to get digit value. Afterwards, you have counter that starts from right 
    and you also know the length. If its 1 you add, 2^n, n is location if not you dont add 2^n. At the end you're 
    running sum will the decimal value. BDC is the same as DBC when looking at its length, however the value at each
    position differs, similary how hexadecimal works.


