Charishma Thota
cthota@ucsc.edu
03/16/18
Lab 7: FLOATING POINT CALCULATIONS
01J, Eshan Hemmati 

Describe What You Learned:
    I learned what IEEE 754 SP Floating Point numbers were. I learned the conversion tecniques with this representation
    and learned the different ways I could represent them.

What Was Surprising:
    I was surprised on the many parts of an IEEE floating point number, such as the sign bit, exponenet factor, and 
    the manitissa. Learning about how all these parts represented the floating point number was interesting.

What Worked Well:
    The first few questions on the lab were pretty easy. For instance, I really liked the chart because it helped me    
    get exposed and familiar to the parts of the IEEE 754 SP Floating Point Number. 

What Did Not:
    The multiplication of IEEE floating point numbers was hard to grasp at first especially when multiplying the 
    fraction part. For instance in 4b I wasn't sure how many bits I should include when multipling the fractions for
    the first hex. I figured that since the second hex has a bunch of 0's following its previous values that it 
    shouldn't really matter how many bits I include as long as I include the same number of bits until the 2nd hex 
    reaches its repeating 0s.

What are the largest and smallest positive numbers IEEE 745 SP floating point can express? Describe them in IEEE 
745 SP and in decimal base-10 scientific notation? :
    The largest positve number IEEE 754 floating point number is 1 x 2^127 and in decimal is 10^38.53. The smallest 
    positive that can be expressed in IEEE 754 SP floating point is 2^-23 x 2^-127 and in decimal is 10^-44.55.

IEEE 745 SP uses bias representation in the exponents to speed up floating point addition and subtraction. Why is
this faster than using 2SC representation? :
    It is more efficient and faster to just use the exponenets to speed up addition and subtraction for floating point.
    This would only require less number of steps to compare biases than using 2SC. This is because in 2SC you would 
    have to worry about both exponenet and mantissa. 

Imagine you are using a MIPS processor which does not contain specialized hardware for floating point operations. 
You must instead code these yourself. Write some pseudocode for subroutines called FL_add and FL_mult, which will 
perform floating point addition and multiplication on two IEEE 745 SP numbers. Don’t forget to check for zero! :
    FL_add:
        -conver HEX to Binary
        -store the sign bit
        -get the eight bits after the sign bits.
            - convert the eights bits into decimal for each IEEE floating numner
            - subtract that decimal value with 127 (this is your exponent factor)
        -get the mantissa for each IEEE floating number.
        -add the two mantissa including the exponent factor
        -if you need normalize the sum, shift accordingly and add or subtract that number of shifts to the exponenet 
            factor
        -ignore the hidden 1, and convert back to Binary
        -then group by 4 and convert back to HEX.
        - account for sign bit
    FL_mult:
        -convert each hex number to Binary
        -store the sign bit
        -get the mantissa
            -multiply the mantissa
            -if you need normalize the product, shift accordingly and add or subtract that number of shifts to the 
                exponenet factor
            - if you shift, make sure to store the shift to add later at the exponent part
        -add the exponent bits from both hex numbers
        -ignore the hidden 1, convert back to binary form by ignoring hidden 1
        -account for sign bit


