//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 10 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 2
// Lab due date: 17 February 2025
//
// Purpose of program: Harness for single full adder unit.
//
// Additional files needed: N/A
//
// Date of last modification: 17 February 2025 @ 17:48
//*************************************************************************

module fullAdder_top;

fullAdder_io top_io();
fullAdder DUT(.a(top_io.a), .b(top_io.b), .carryIn(top_io.carryIn), .carry(top_io.carry), .sum(top_io.sum));
fullAdder_testbench(top_io);

endmodule
