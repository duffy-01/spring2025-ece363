//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 16 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 17 February 2025 @ 11:59PM
//
// Purpose of program: Interface for counter.sv.
//
// Additional files needed: counter.v
//
// Date of last modification: 17 February 2025 @ 22:17
//*************************************************************************

interface counter_io(input logic clk);
    // Inputs
    logic en;
    logic d;
    logic clk;
    logic reset;
    // Outputs
    logic [1:0] out;

    // Clocking block
    clocking cb @(posedge clk);
        default input #1 output #0;
        output reset;
        output out;
    endclocking

    default clocking cb;

    // Reset block
    modport TB(clocking cb, output reset, input out, output d, output en);
endinterface
