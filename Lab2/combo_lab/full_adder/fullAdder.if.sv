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

interface fullAdder_io;
        logic a, b, carryIn;
        logic carry, sum;

        modport TB (output a, b, carryIn, input carry, sum);
endinterface
