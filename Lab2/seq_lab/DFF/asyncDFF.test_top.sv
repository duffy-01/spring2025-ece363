//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 16 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 17 February 2025 @ 11:59PM
//
// Purpose of program: Harness for asyncDFF.sv.
//
// Additional files needed: 
//
// Date of last modification: 17 February 2025 @ 22:17
//*************************************************************************

module async_DFF_top;
    parameter sim_cycle = 10;
    reg sys_clk;

    asyncDFF_io top_io(sys_clk);
    asyncDFF_tb test(top_io);
    asyncDFF DUT(.reset(top_io.reset), .data(top_io.data), .clk(top_io.clk), .enable(top_io.enable), .q(top_io.q), .q_n(top_io.q_n));

    // system clock

    initial begin
        sys_clk = 0;
        forever 
	begin
		#(sim_cycle/2) sys_clk = ~sys_clk; 
	end
    end
endmodule
