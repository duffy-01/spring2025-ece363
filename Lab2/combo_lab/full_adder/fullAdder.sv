//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 10 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 2
// Lab due date: 17 February 2025
//
// Purpose of program: Implement single full adder unit.
//
// Additional files needed: N/A
//
// Date of last modification: 17 February 2025 @ 17:48
//*************************************************************************

//******************
//
// Start of Module
//    full_ADD
//
//******************

module fullAdder ( 		// defining data inputs and outputs
	input wire a, 		// input data
	input wire b,
	input wire carryIn,
    output wire sum,
    output wire carry
);

    wire w1, w2, w3, w4;	// connective wires

    xor(w1, a, b);		// finding the sum from a, b, and our carry in	
    xor(sum, w1, carryIn);	// xor used in lieu of AND, OR, & NOT for clarity

    and(w2, a, b);		//parameters needed to obtain carry out
    and(w3, b, carryIn);
    and(w4, carryIn, a);	

    or (carry, w2, w3, w4);	// calculating the carry out
    
endmodule
