//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 5 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 12:00AM
//
// Purpose of program: Implement single full adder unit.
//
// Additional files needed: N/A
//
// Date of last modification: 6 February 2025 @ 22:48
//*************************************************************************

//******************
//
// Start of Module
//    full_ADD
//
//******************

module full_ADD ( 		// defining data inputs and outputs
	input wire a, 		// input data
	input wire b,
	input wire carryIn,
	output sum,
	output carry
);

    wire w1, w2, w3, w4;	// connective wires

    xor(w1, a, b);		// finding the sum from a, b, and our carry in	
    xor(sum, w1, carryIn);	// xor used in lew of AND, OR, & NOT for clarity

    and(w2, a, b);		//parameters needed to obtain carry out
    and(w3, b, carryIn);
    and(w4, carryIn, a);	

    or(carry, w2, w3, w4);	//getting our carry out
    
endmodule
