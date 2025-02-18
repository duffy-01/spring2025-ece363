//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 15 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 2
// Lab due date: Monday 17 February 2025
//
// Purpose of program: Interface for 2-bit adder unit.
//
// Additional files needed: N/A
//
// Date of last modification: 17 February 2025 @ 17:48
//*************************************************************************

interface rippleADD_io;
        logic [1:0]a;
        logic [1:0]b;
        logic carryIn;
        logic carry;
        logic [1:0]sum;

        modport TB (output a, b, carryIn, input carry, sum);
endinterface
