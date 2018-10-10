Charishma Thota
cthota@ucsc.edu
02/16/18
Lab 4: DEADBEEF in Mips
01J, Eshan Hemmati 

Magic Numbers: 9671, 0x1224, 3333
What I Learned:
    I learned how to code in MIPS. It was difficult to understand at first, however this programming assignment, 
    because of its simplicity, made it a lot easier to get the hang of MIPS. In addition, I also learned how
    MARS java applet worked and how to compile and run the MIPS code I wrote. It was also really interesting to 
    learn all the new syntax in MIPS. It was something I never seen before, and learning this language exposed
    me a very different kind of programming langauge then the ones im used to. 

What Was Surprising:
    What was really surpising was the difference in the syntax of these language comapared to popular ones like 
    Java and C/C++. To code a for loop would take multiple lines in MIPS but only one line in these popular 
    programming languages. It was also surpising to see how loops and if statements worked in MIPS and how you
    can jump to specfic "label" depending on the condition your code meets. 

What Worked Well:
    What really worked well was having the "Introduction to the MIPS Assembly Language Programming" book as a 
    guide to help introduce myself to this new programming language. The book was very informative and I was 
    able to use some of the MIPS code in the book to help me code this program. Also what worked really well, 
    was having the Lab1 code already done. This way I already had a basis on what my program needed to do. 

What Did Not:
    Understanding what each line of code was doing took a lot of time because I never seen anything like this 
    before. However, after trail and error a couple times I was able to understand the idea of storage, address,
    and simple MIPS code.

In theory, how large can N be before your program fails? What determines this limit?:
    The number, N, can be as large as the size of the register it gets read into and stored into. So in this case,
    the largest N will be is the largest 2^16 number. The register determine this limit. 

After assembling your program, what is the range of addresses in which this string is stored?:
    The range of addresses that gets stored is within 0x00400000 and 0x00400008. This makes sense because in MIPS,
    memory address are always 32 bits.

Which were pseudo-ops? How do the assembled instructions produce the appropriate result?:
    Out of the instructions I used addi, beq, j, syscall were similar to the pseudo-ops that MIPS translated to. 
    Psuedo-ops are basically an expansion of the MIPS instruction because technically a MIPS instruction can be 
    performed by performing other instructions either within one step or multiple steps. For example, the move
    instruction transfers the value in a register to another register by basically adding the value with 0. So 
    "move $s0, $v0 " is basically "add $s0, $v0, 0". 

How many registers did you use in writing this program? Could you have used fewer registers?Describe how, or 
explain why you cannot:
    While writing this program, I used 11 different registers to store my data. I bet I could have used fewer 
    registers to make more program more efficient and smaller. For example I had to add 1 to the user's input so 
    the for loop would run until the user inputed number and not 1 less than it (because that is what was happening
    before I added one). I bet there was a way to not use a different register to store that input + 1 value and 
    instead to use a condition when the the iterator reaches the user inputed value. Also I probably did not need to
    load the values "4" and "9" into registers. 
