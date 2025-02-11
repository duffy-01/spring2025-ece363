//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 7 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 11:59PM
//
// Purpose of program: Test bench for counter.v.
//
// Additional files needed: counter.v
//
// Date of last modification: 10 February 2025 @ 16:40
//*************************************************************************

//******************
//
// Start of Module
//    counter_tb
//
//******************

`timescale 1ns/100ps

module counter_tb;	//defining inputs/outputs
	reg clk;		
	reg d;
	reg en;
	reg reset;
	wire [1:0]out;	//need two bits to define output state

	counter dut (
			.d(d),		//*******************************
			.clk(clk),	// pipelining counter to tb
			.reset(reset),	// maybe I shouldn't use the
			.en(en),	// same variables next time
			.out(out)	//
		    );			//*******************************

	initial begin			//defining a clock with a cycle of 10ns
		clk = 0;
		forever #5 clk = ~clk;
	end

initial begin //start of test cases
        //****************************************
	//TODO:
	//
	//	GIVEN TEST CASES
	//
	//	START OF ZERO PATTERN
	//
	//	START OF ONE PATTERN
	//
	//	LAST RESET VERIFICATION
	//
	//****************************************

	reset = 1;
	en = 0;
	d = 0;
	#10;

	reset = 0;  
	en = 0;
	d = 0;
	#10;

	en = 1;
	d = 0;
	#10; 

	d = 1; 
	#10;

	d = 0;
	#10;

	d = 1;
	#10;

	d = 0;
	#10; 

	d = 1;
	#10; 

	d = 0;
	#10;

	d = 1;
	#10; 

	d = 0;
	#10; 

	en = 0;
	reset = 1; 
	#10;

	reset = 0;
	#10;
end

initial begin
	$dumpvars;
	$dumpfile("counter.vcd");
end


initial begin		//display output in truth table format
	$display("\tclk\td\ten\treset\tout");
	$monitor("\t%0b\t%0b\t%0b\t%0b\t%02b", clk, d, en, reset, out);
end

initial #160 $finish; 	//run test bench for 16 clock cycles (160ns)

endmodule
