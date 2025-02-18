interface practice_io(input logic clk);
	logic w, reset, z; 
	
	//set up clock
	clocking cb@(posedge clk);
		default input #1 output #0;
		output reset;
	endclocking 

	//pick the default 
	default clocking cb;

	//interfacing control
	//with respect to the TB
	modport TB(clocking cb, output reset, output w, input z);
endinterface 
