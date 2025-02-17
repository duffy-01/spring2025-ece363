//harness
module fullAdder_top;
parameter sim_cycle=100;
reg sys_clk;

fullAdder_if top_if(sys_clk);
fullAdder_tb test(top_io);
  dual_pattern dut(.a(top_io.a), .clk(top_io.clk), .b(top_io.b), .carryIn(top_io.carryIn), .carry(top_io.carry), .sum(top_io.sum));

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
