//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 7 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 11:59PM
//
// Purpose of program: Test bench for DFF with asynchronous reset.
//
// Additional files needed: aysnc_DFF.v
//
// Date of last modification: 10 February 2025 @ 16:55
//*************************************************************************

//******************
//
// Start of Module
//    async_DFF_tb
//
//******************

`timescale 1ns/100ps

module asyncDFF_tb;	//******************
	reg clk;	//
	reg data;	// variable declaration
	reg enable;	// & pipelining
	reg reset;	// 
	wire q;		//*****************
	wire q_n;

	asyncDFF dut (	//gosh I keep doing the same thing...
	.clk(clk),
	.data(data),
	.enable(enable),
	.reset(reset),
	.q(q),
	.q_n(q_n)
	);

initial begin		//generating a clock signal w/ T = 10ns
	clk = 0;	//i.e. rising edge -> rising edge = 10ns		
	forever #5 clk = ~clk;
end

initial begin		//**************
	reset = 1;  	//
	data = 0;	// TEST CASES
	enable = 0;	//
	#10;       	//**************

	reset = 0;  
	data = 1;	//second most important
	enable = 0;	//verifies enable behavior
	#10;

	data = 0;	//dff enabled, here we go!
	enable = 1; 
	#10;

	data = 1;	
	#10;

	data = 0;
	#10;

	data = 1;
	#10;

	data = 1;
	enable = 0;
	#10;

	data = 0;
	#10;

	data = 1;	//arguably most important case to observe
	reset = 1;	//verifies resetting behavior
	#10;

	data = 1;
	enable = 0;
	#10;
end

initial begin //display output in a truth table format
	$display("\tdata\treset\tenable\tq\tqn\tclk");    
	$monitor("\t%0b\t%0b\t%0b\t%0b\t%0b\t%0b", data, reset, enable, q, q_n, clk);	
end

initial #100 $finish; //end after 10 clock cycles or 100ns

endmodule
