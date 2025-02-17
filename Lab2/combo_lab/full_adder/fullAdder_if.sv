interface fullAdder_if(input logic clk);
	logic a, b, carryIn, sum, carry; 
	
	//set up clock
	clocking cb@(posedge clk);
		default input #1 output #0;
		output reset;
	endclocking 

	//pick the default 
	default clocking cb;

	//interfacing control
	//with respect to the TB
    modport TB(clocking cb, output a, output b, output carryIn, input sum, input carry);
endinterface 
