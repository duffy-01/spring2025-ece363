//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 15 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 2
// Lab due date: Monday 17 February 2025
//
// Purpose of program: Test Bench for single full adder unit.
//
// Additional files needed: fullAdder.v
//
// Date of last modification: 17 February 2025 @ 17:48
//*************************************************************************

`timescale 1ns/1ps

module fullAdder_tb;			
	fullAdder_interface dut(.clk(clk));		//******************************
	fullAdder_harness harness(dut);			// 	boilerplate to connect tb
											// 	to the device-under-test
											//******************************

initial begin
	a = 0;		//initializing a, b, and cin as zero
	b = 0;
	carryIn = 0;	
end

always begin
	#5 carryIn = 1; 				//truth table of test cases
	#5 carryIn = 0; b = 1;			//c-in oscillates ever 5ns
	#5 carryIn = 1; 				//b every 10ns
	#5 carryIn = 0; b = 0; a = 1;	//a after 20ns
	#5 carryIn = 1; 
	#5 carryIn = 0; b = 1; 
	#5 carryIn = 1;
end

initial begin						//------------------------	
	$dumpfile("fullADDTest.vcd");	// boilerplate to dump vcd
	$dumpvars;						// and display TT output
end									//-------------------------

initial begin
	$display("a,\tb,\tcIn,\tcout,\tsum");
	$monitor ("%0h\t%0h\t%0h\t%0h\t %0h", a, b, carryIn, carry, sum);
end

initial #45 $finish;	//run for 45ns then finish
endmodule
