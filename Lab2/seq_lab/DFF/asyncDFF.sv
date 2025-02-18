//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 5 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 17 February 2025 @ 11:59PM
//
// Purpose of program: Implement DFF with asynchronous reset.
//
// Additional files needed: N/A
//
// Date of last modification: 10 February 2025 @ 17:01
//*************************************************************************

//******************
//
// Start of Module
//    asyncDFF
//
//******************

module asyncDFF (clk, data, enable, reset, q, q_n);
    input wire clk;	//***************
    input wire data;	//
    input wire enable;	// Defining i/o
    input wire reset;	//
    output reg q, q_n;	//**************

    //the first line of this always block asserts that whatever inside will
    //happen at the rising edge of the clock, reset, or enable signals
 
    always @ (posedge clk or posedge reset or posedge enable)
        begin
            if (reset)  	// if reset = 1, q = 0
                begin		// until reset != 1
                    q <= 0;
                    q_n <= 1;
                end
            else if (enable) 	// if enable =1, data passes thru
                begin		// otherwise no data passthru :^(
                    q <= data;
                    q_n <= !data;
                end
        end
endmodule
