//harness
module fullAdder_top;
parameter sim_cycle=100;
reg sys_clk;

dual_io top_io(sys_clk);
dual_test test(top_io);
dual_pattern dut(.reset(top_io.reset), .clk(top_io.clk), .w(top_io.w), .z(top_io.z));

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
