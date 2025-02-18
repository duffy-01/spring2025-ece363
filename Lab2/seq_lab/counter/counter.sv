//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 8  February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 11:59PM
//
// Purpose of program: Implement counting circuit with specifications outlined
// in lab 1, part 2.
//
// Additional files needed: aysnc_DFF.v
//
// Date of last modification: 10 February 2025 @ 16:49
//*************************************************************************

//******************
//
// Start of Module
//    counter
//
//******************

`include "../DFF/asyncDFF.sv"

module counter(d, clk, reset, en, out);
	input d, clk, reset, en;
	output [1:0]out;

	wire q1, q1n, q0, q0n;	//present state variables
	wire q1ns, q0ns;	//next state variables
	wire d_n, en_n;

	wire q1p1, q1p2, q1p3, q1p4;	//product terms q1*
	wire q0p1, q0p2, q0p3, q0p4;	//product terms q0*

	not(d_n, d); 	//obtaining complement of d & en
	not(en_n, en);
	
	//********************************
	// Combinational Logic from K-maps
	//*******************************
	
	//Q1* = en' & q1 + en & d & q1 + en & d & q1' & q0 + en & d' & q1 & q0
	and(q1p1, en_n, q1);
	and(q1p2, en, d, q1);
	and(q1p3, en, d, q1n);
	and(q1p4, en, d_n, q1, q0);
	or(q1ns, q1p1, q1p2, q1p3, q1p4);
	
	//Q0* = en'&q0 + en & q1' & q0' + en & d & q1' & q0' + en & d & q1 & q0
	and(q0p1, en_n, q0);
	and(q0p2, en, d, q1n, q0);
	and(q0p3, en, d, q1n, q0n);
	and(q0p4, en, d, q1, q0);	
	or(q0ns, q0p1, q0p2, q0p3, q0p4);


	//********************************
	// Sequential Logic from DFFs
	//*******************************

	asyncDFF ff1(clk, q1ns, en, reset, q1, q1n);
	asyncDFF ff0(clk, q0ns, en, reset, q0, q0n);

	//using buffers to pass out our outputs from ff1 and ff0
	//i.e. q0 = out0 and q1 = out1
	
	buf(out[0], q0);
	buf(out[1], q1);
endmodule
