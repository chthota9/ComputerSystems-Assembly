Charishma Thota
cthota@ucsc.edu
02/07/18
Lab 3: Ripple Adder With Memory
01J, Eshan Hemmati 

What Did I Learn: 
    I learned how to build a 6 bit adder using register,invertor, and adder logic. Through this lab, I was also 
    able to see the difference between combinational and sequential logic. Combinational logic depended on only
    present input, whereas sequential depends on both the past and present inputs. For example, the flip flops 
    stores the R_0 - R_5 values by adding or subtracting the present input without getting rid of the past input,
    which resembles sequential logic.However, the adder only accounts for the present total value and the new 
    present input that was pushed in by the user, which shows combinational logic. 

What Was Surprising:
    I was surprised to see that sender and reciever signals can work from differing pages on MML and that they 
    don't have to be in the same page as it's matching sender or reciever. 

What Worked Well:
    Getting binary addition to work wasn't that much of a problem. This is probably because I didn't have to 
    worry about inverting and adding one to a number, as you would do for subtraction. So at first, I just 
    simply used the K_0 - K_5 inputs, skipping the inverter part, just to check if my flip flops were working
    and storing the running sum. This was easy to check, after getting my adder logic down. 

What Did Not Work Well:
    Now that I add to worry about subtraction, I wrote out a truth table to get down the logic for the inverter,
    since I wasn't quite sure how a MUX worked. So basically the AddSub could either be 0 or 1 and the K input 
    can either be 0 or 1. That gives me four possible combinations: 0 0, 0 1, 1 0, 1 1 (where the AddSub was the 
    most significant bit and the K input was the least significant input). If AddSub was 1, then the K input has 
    to be inverted, so I needed logic that implemented that. It took me a while and a lot of trail and error, but
    eventually I figured out that it was simply just an XOR gate. 

Issues Building The Circuit/ How I built my Adder:
    The obvious issue I had building the adder circuit was trying to figure out the logic. I The first thing I did
    was use a truth table with three inputs (Carry, T, and B) and two outputs(Sum and COut). From 000 - 111, I wrote
    the subsquent output. At first I realized I need a logic gate that implements a simple addition and XOR does that
    because whenever the inputs differ the output is true, which resembles addition in binary. So since I needed to
    XOR all three values inputs I needed two XOR gates( one for T and B and the other for TB and Carry). However, from
    there I wasn't sure how to implement the Carry Out value. I later realized that there is only a carry out when
    1 + 1 occurs, so you would need a logic gate that outputs true whenever 1 + 1 occurs, which the AND gate does.
    Therefore, as long one of the AND gates (AND of TB and Carry or AND of T and B) outputs true you know the 
    addition of 1+1 occurs somewhere so your Cout has to equal to 1. An OR of the two AND gates allows Cout to be 
    1 as long as one of the AND gates outputs true. 

Describe what you added to each module to make debugging easier:
    I added LED lights to each 1 bit adder to make sure it was outputing the correct bit. I did this by connecting
    and LED light to the "Sum:" wire. In addition I also, connecting another LED ligts to the carry out wire just
    to make sure my carry out was workign correctly too. However, I took out these LED lights to make sure the 
    design was clean after making sure everything works. I also kept an LED at the flip flops and inverters to 
    make sure everything was being stored correctly and inverted correctly. 

What happens when you subtract a larger number from a smaller number? Does the result make sense?:
    When you subtract a larger number from a smaller number, the adder seems to display a hexadecimal number. By,
    trying more inputs, I realized it was ouputing the sum of the number previosuly pushed in(or the running sum) 
    and the 2's complement of the new number pushed in. For example if you did 1 - 7, you would get 3A, This 
    occurs because it would take the 2s complement of 7 which is 000111 --> 111001(inverting and adding one). So 
    now it's 000001 + 111001 which is 111010. We know that this is -6 because if you add 000110 (which is 6 in 
    binary) you woudld get 0. However, since the display doesnt output negative numbers it shows the hexadecimal
    output for 111010, which if you convert to decimal it is 58 which is 3A in hexadecimal, but this also 
    represents -6 becuase adding it wiht 6 gets you 0.

What happens when you add two numbers that won’t fit in 6 bits?:
    When you add two numbers that wont fit 6 bits, the display only outputs the first 6 bits. So the extra amount
    after 3F (which is 63 in decimal) will only get displayed because it is within 6 bits. For instance if you 
    would to add 000100 to 111111 (3F) you would get 1000011 (63 + 4 = 67). However the since the display will only 
    show everything after the bar of 1|000011, so the display shows the numebr 3 which is 000011 in 6 bit binary 
    representation.


