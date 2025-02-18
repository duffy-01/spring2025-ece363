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

`timescale 1ns/100ps

program rippleADD_testbench(rippleADD_harness.tb, fullAdder);	


initial begin				//init a, b, and cin
	a = 2'b00;				//as 00, 00, and 0
	b = 2'b00;
	carryIn = 0;
end

always begin				//queue the truth table style of test case iteration
	#5 carryIn = 1;
	#5 carryIn = 0; a = 2'b01;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b10;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b11;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b00; b = 2'b01; 
	#5 carryIn = 1;
	#5 carryIn = 0; a = 2'b01;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b10;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b11;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b00; b = 2'b10; 
	#5 carryIn = 1;
	#5 carryIn = 0; a = 2'b01;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b10;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b11;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b00; b = 2'b11; 
	#5 carryIn = 1;
	#5 carryIn = 0; a = 2'b01;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b10;
	#5 carryIn = 1; 
	#5 carryIn = 0; a = 2'b11;
	#5 carryIn = 1; 
end

initial begin				//----------------------
	$dumpfile("rippleADDTest.vcd");	// Dumpfile and TT
	$dumpvars;			// output boilerplate
end					//
					//---------------------
initial begin
	$display("\ta,\tb,\tcIn,\tcout,\tsum");
	$monitor ("\t%02b\t%02b\t%0b\t%0b\t%02b", a, b, carryIn, carryOut, sum);
end

initial #160 $finish;	// run for 160ms, then finish
endmodule
