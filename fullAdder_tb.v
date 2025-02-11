//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 5 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 12:00AM
//
// Purpose of program: Test Bench for single full adder unit.
//
// Additional files needed: fullAdder.v
//
// Date of last modification: 9 February 2025 @ 17:48
//*************************************************************************

`timescale 1ns/1ps

module full_ADD_tb;			
	reg a;
	reg b;
	reg carryIn;			//******************************
	wire sum;			//
	integer i;			// defining tb vars and 
					// pipelining the dut
	full_ADD dut(.a(a),		//
		.b(b),			//******************************
		.carryIn(carryIn),
		.carry(carry),
		.sum(sum));

initial begin
	a = 0;		//initializing a, b, and cin as zero
	b = 0;
	carryIn = 0;	
end

always begin
	#5 carryIn = 1; 		//truth table of test cases
	#5 carryIn = 0; b = 1;		//c-in oscillates ever 5ns
	#5 carryIn = 1; 		//b every 10ns
	#5 carryIn = 0; b = 0; a = 1;	//a after 20ns
	#5 carryIn = 1; 
	#5 carryIn = 0; b = 1; 
	#5 carryIn = 1;
end

initial begin				//------------------------	
	$dumpfile("fullADDTest.vcd");	// boilerplate to dump vcd
	$dumpvars;			// and display TT output
end					//-------------------------

initial begin
	$display("a,\tb,\tcIn,\tcout,\tsum");
	$monitor ("%0h\t%0h\t%0h\t%0h\t %0h", a, b, carryIn, carry, sum);
end

initial #45 $finish;	//run for 45ns then finish
endmodule
