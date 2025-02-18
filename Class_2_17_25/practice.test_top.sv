//This is the harness file for the coverage practice problem
module practice_test_top;
  parameter simulation_cycle = 100;
  reg  SystemClock;

	practice_io top_io(SystemClock);

	practice_test test(top_io);

practice dut(
    .w	(top_io.w),
    .clk	(top_io.clk),
    .reset	(top_io.reset),
    .z	(top_io.z)
  );
  
  
  
  initial begin
    SystemClock = 0;
    forever begin
      #(simulation_cycle/2)
        SystemClock = ~SystemClock;
    end
  end

endmodule
