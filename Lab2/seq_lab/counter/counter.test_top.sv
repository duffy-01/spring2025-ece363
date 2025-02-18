//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 16 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 17 February 2025 @ 11:59PM
//
// Purpose of program: Harness for counter.sv.
//
// Additional files needed: counter.v
//
// Date of last modification: 17 February 2025 @ 22:17
//*************************************************************************

module counter_top;
    parameter sim_cycle = 100;
    reg sys_clk;

    counter_io top_io(sys_clk);
    counter_tb test(top_io);
    counter DUT(.reset(top_io.reset), .clk(top_io.clk), .count(top_io.count));

    // system clock

    initial begin
        sys_clk = 0;
        forever begin#(sim_cycle/2) sys_clk = ~sys_clk; end
    end
endmodule