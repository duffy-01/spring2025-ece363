//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 7 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 11:59PM
//
// Purpose of program: Test bench for counter.v.
//
// Additional files needed: counter.v
//
// Date of last modification: 10 February 2025 @ 16:40
//*************************************************************************

//******************
//
// Start of Module
//    counter_tb
//
//******************

`timescale 1ns/100ps

module counter_tb;      //defining inputs/outputs
        reg clk;
        reg d;
        reg en;
        reg reset;
        wire [1:0]out;  //need two bits to define output state

        counter dut (
                        .d(d),          //*******************************
                        .clk(clk),      // 
                        .reset(reset),  // pipelining counter to tb
                        .en(en),        // 
                        .out(out)       //*******************************
                    );                  

        initial begin                   //defining a clock with a cycle of 10ns
                clk = 0;
                forever #5 clk = ~clk;
        end

initial begin //start of test cases
        //****************************************
        //      GIVEN TEST CASES
        //****************************************

        reset = 1;
        en = 0;
        d = 0;
        #20;

        reset = 0;
        en = 1;
        d = 1;
        #20;

        d = 1;
        #20;

        reset = 1;
        en = 1;
        d = 1;
        #20;

        //****************************************
        //      START OF ZERO ITERATION
        //****************************************

        reset = 0;
        d = 0;
        #20;
        #20;

        reset = 1;
        #20;

        //****************************************
        //      START OF ONE ITERATION
        //****************************************

        reset = 0;
        d = 1;
        #20;
        #20;
        #20;
        #20;
        #20;
        #20;

        reset = 0;
        #20;

        //****************************************
        //      STATE 01 RESET VERIFICATION
        //****************************************

        reset = 0;
        d = 1;
        en = 1;
        #20;

        reset = 1;
        #20;

end

initial begin
        $dumpvars;
        $dumpfile("counter.vcd");
end


initial begin           //display output in truth table format
        $display("\tclk\td\ten\treset\tout");
        $monitor("\t%0b\t%0b\t%0b\t%0b\t%02b", clk, d, en, reset, out);
end

initial #320 $finish;   //run test bench for 32 clock cycles (320ns)

endmodule
