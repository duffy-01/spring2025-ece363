//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 14 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 2
// Lab due date: 17 February 2025
//
// Purpose of program: Harness for 2-bit full adder.
//
// Additional files needed: N/A
//
// Date of last modification: 17 February 2025 @ 17:26
//*************************************************************************

module rippleADD_harness;
parameter sim_cycle=100;
reg sys_clk;

rippleADD_interface interface(sys_clk);
rippleADD_tb test(interface);
rippleADD dut(.a(interface.a), .clk(interface.clk), .b(interface.b), .carryIn(interface.carryIn), .carry(interface.carry), .sum(interface.sum));

//clk
initial
begin
sys_clk=0;
forever
begin
#(sim_cycle/2) sys_clk=~sys_clk;
end
end
endmodule