// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//sets R0 to 16384 (first RAM location for screen)
@16384
D=A
@R0
M=D

//sets R1 to 24575 (last RAM location for screen)
@24575
D=A
@R1
M=D

(LOOP)
    // checks if there is any keyboard input, jumps to part for clearing if not
    @24576
    D=M
    @CLEAR
    D;JEQ

    @R0
    A=M // sets A to current value of R0
    M=-1 // sets value of that memory location to -1
    @R0 
    MD=M+1 // increments R0 by 1 and sets D to that incremented value
    @R1
    D=D-M // subtracts 24575 from D
    @END 
    D;JGT // checks if R0 is over 24575. If so, jumps to end of program (infinite loop)

    @LOOP 
    0;JMP // jumps back to beginning of loop

// part for clearing screen if no key is pressed
(CLEAR)
    @R0
    A=M-1 //sets A to the previous number in R0 (last RAM location that was colored black)
    M=0 // sets that RAM location to white

    // checks if R0 is greater than 16384, if not jumps to LOOP otherwise subtracts 1 from R0
    @R0
    D=M
    @16384
    D=D-A
    @LOOP
    D;JLE

    @R0
    M=M-1

    // jumps back to keyboard check
    @LOOP
    0;JMP

// end of program (infinite loop)
(END)
    @END
    0;JMP
