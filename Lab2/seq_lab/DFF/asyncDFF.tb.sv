//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 7 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 11:59PM
//
// Purpose of program: Test bench for DFF with asynchronous r.
//
// Additional files needed: aysnc_DFF.v
//
// Date of last modification: 10 February 2025 @ 16:55
//*************************************************************************

//******************
//
// Start of program
//    async_DFF_tb
//
//******************

program asyncDFF_tb(asyncDFF_io.TB asyncDFF);

initial begin		//**************
	asyncDFF.reset = 1;  	//
	asyncDFF.data = 0;		// TEST CASES
	asyncDFF.enable = 0;		//
	#10;       		//**************

	asyncDFF.reset = 0;  
	asyncDFF.data = 1;	//second most important
	asyncDFF.enable = 0;	//verifies asyncDFF.enable behavior
	#10;

	asyncDFF.data = 0;	//dff enabled, here we go!
	asyncDFF.enable = 1; 
	#10;

	asyncDFF.data = 1;	
	#10;

	asyncDFF.data = 0;
	#10;

	asyncDFF.data = 1;
	#10;

	asyncDFF.data = 1;
	asyncDFF.enable = 0;
	#10;

	asyncDFF.data = 0;
	#10;

	asyncDFF.data = 1;	//arguably most important case to observe
	asyncDFF.reset = 1;	//verifies resetting behavior
	#10;

	asyncDFF.data = 1;
	asyncDFF.enable = 0;
	#10;
end;

initial begin //display output in a truth table format
	$display("\tdata\treset\tenable\tq\tqn\tclk");    
	$monitor("\t%0b\t%0b\t%0b\t%0b\t%0b\t%0b", asyncDFF.data, asyncDFF.reset, asyncDFF.enable, asyncDFF.q, asyncDFF.q_n, asyncDFF.clk);	
end

initial #100 $finish; //end after 10 clock cycles or 100ns

endprogram
