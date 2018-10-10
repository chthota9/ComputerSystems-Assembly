//-----------------------------------------
//Charishma Thota
//cthota
// DeadBeef.java
// program that iterates through the numbers 1 to 1000 and prints out
// "DEAD" if the number is divisble by 4, "BEEF" if the number is divisble by 9
// and "DEADBEEF" if the number is divisible by 4 and 9, and the number if not divisible
// by 4 or 9
// this is in java
// ----------------------------------------

import java.lang.Math;
import java.util.*;
import java.io.*;


class DeadBeef{
    public static void main(String[] args) throws IOException{
    
        for(int i = 1; i<= 1000; i++){
            if((i % 4) == 0 && (i % 9) == 0) { // if its divisble by 4 and 9
                System.out.print("DEADBEEF");
            } 
            else if((i % 4) == 0){ // if its divisble by 4
                System.out.print("DEAD");
            }
            else if((i % 9) == 0) { // if its divisble by 9
                System.out.print("BEEF");
            }
            else if ((i % 4) != 0 && (i % 9) != 0) { // if its not divisble by either
                System.out.print(i);
            }
            System.out.println();
        } // end of main foor loop
    } // end of main class
} // end of class DeadBeef