//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 8 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 12:00AM
//
// Purpose of program: Implement 2 bit ripple carry adder.
//
// Additional files needed: ../fullADD/fullAdder.v
//
// Date of last modification: 10 February 2025 @ 4:48
//*************************************************************************

//******************
//
// Start of Module
//    rippleADD
//
//******************

`include "../full_adder/fullAdder.sv"

module rippleADD(		//--------------------------
	input[1:0] a, b,	// var declaration
	input carryIn,		// note a,b, & sum are [1:0]
	output[1:0] sum,	//-------------------------
	output carryOut);

wire carryWithin;		// declare an internal "rippling" carry

// stage 1 and stage two of the ripple carry adder

full_ADD stage0(a[0], b[0], carryIn, sum[0], carryWithin); 
full_ADD stage1(a[1], b[1], carryWithin, sum[1], carryOut);

endmodule
