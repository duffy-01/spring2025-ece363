//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 15 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 2
// Lab due date: Monday 17 February 2025
//
// Purpose of program: Interface for 2-bit full adder.
//
// Additional files needed: N/A
//
// Date of last modification: 17 February 2025 @ 17:48
//*************************************************************************

interface rippleADD_interface(input logic clk); //interface for 2-bit full adder
	logic [1:0]a, [1:0]b, carryIn, carry, [1:0]sum; //inputs and outputs
	
	//set up clock
	clocking cb@(posedge clk); //clocking block
		default input #1 output #0; 
	endclocking   

	//pick the default 
	default clocking cb;

	//interfacing control with respect to the tb
    modport tb(clocking cb, output a, output b, output carryIn, input sum, input carry);
	
	endinterface 
