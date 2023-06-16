// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@R2
M=0 // sets R2 to 0

// jumps to end if R1 is 0
@R1
D=M
@16
D;JEQ

@R0
D=M // sets D to value of R0
@R2
M=M+D // adds D(R0) to R2
@R1
M=M-1 // subtracts 1 from R1
D=M // sets D to value of R1
@6
D;JGT // loops if D(R1) is not 0

@16
0;JMP // infinite loop