Charishma Thota
cthota@ucsc.edu
03/09/18
Lab 6: VIGNERE CIPHER
01J, Eshan Hemmati 

Magic Numbers: 0b1100

Describe What You Learned:
    I learned how the Vignere Cipher worked. Most importantly, I learned how to implement it through MIPS code.
    I also learned how the subroutine functions worked by the encryptstring/ decryptstring subroutines calling
    the encryptchar/ decrpytchar once each loop. This type of calling a routine with another routine reminded of
    recursive calls.

What Was Surprising:
    It was really surprsing to see how test_Lab6.asm worked with Lab6.asm. I did not know this concept was avaliable
    in MIPS. It was really cool seeing the calls of the subroutines in test_Lab6.asm connected to the subroutines
    in Lab6.asm. 

What Worked Well:
    What worked really well was after finishing the encrypt subroutines, the decrypt subroutines were extermely easy
    to implement. It was practically copy and pasting and switching around some statements.

What Did Not:
    Getting encrypt to work was probably the hardest part of this lab. My main issue with the encrpy subroutines was 
    for some reason the output was printing out twice. After debugging for a while, I realized that I simply had to 
    4 to my stack pointer. This fixed my issue and only printed out the output once.

What additional test code did you write? Why? Did it work?:
    The additional test code I had to write was for decrpyt string/char. We had to write this test code in order to test
    our decrypt subroutines. I wrote this code by simply copy and pasting and chaning the variable names. This worked
    with my Lab6.asm code because it would call the corresponding subroutine from the test code and run it the same way
    encrypt was running. I also used additional test code by inputting my on tests between the quoatation marks, to see
    if my code would work properly since the cases that were given to us were fairly simple.

What happens when you attempt encryption with a keystring that has illegal characters (for
example, “NotALegalKey”? Why? :
    When you don't have a valid key input, the program continues to use the ASCII value of invalid key input. However,
    this causes the wrong input and would print out a bunch of weird characters.

How would you write a recursive subroutine (a subroutine that calls itself)?:
    In order to call a recursive subroutine within that subroutine you use "jal". This will jump and link to the 
    that same subroutine. As soon as certain conditions are met, your subroutine would return accordingly and 
    finish the subroutine code by exiting properly. 

According to MIPS calling conventions, arguments should be passed in the $a registers. There
are only 4 of these registers. What could you do to pass more than 4 arguments into a subroutine?:
    To store more than 4 arugments, you would use a stack. So, if there were 5 arguements, the 5th argument 
    would be pushed onto a stack. This means its address will at least be at 16($sp), and any subsequent arguments 
    will be at least at x+4($sp. Then if you subtract from the stack pointer, you can access them. 
