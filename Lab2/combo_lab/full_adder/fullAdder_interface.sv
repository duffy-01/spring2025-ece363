//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 15 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 2
// Lab due date: Monday 17 February 2025
//
// Purpose of program: Interface for single full adder unit.
//
// Additional files needed: N/A
//
// Date of last modification: 17 February 2025 @ 17:48
//*************************************************************************

interface fullAdder_interface(input logic clk);
	logic a, b, carryIn, carry, sum; 
	
	//set up clock
	clocking cb@(posedge clk);
		default input #1 output #0;
	endclocking 

	//pick the default 
	default clocking cb;

	//interfacing control with respect to test bench
    modport tb(clocking cb, output a, output b, output carryIn, input sum, input carry);
	
	endinterface 
