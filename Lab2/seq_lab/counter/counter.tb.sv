//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 7 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 11:59PM
//
// Purpose of program: Test bench for counter.sv.
//
// Additional files needed: counter.v
//
// Date of last modification: 10 February 2025 @ 16:40
//*************************************************************************

//******************
//
// Start of program
//    counter_tb
//
//******************


program counter_tb(counter_io.TB counter);      //defining inputs/outputs


initial begin //start of test cases
        //****************************************
        //      GIVEN TEST CASES
        //****************************************

        counter.reset = 1;
        counter.en = 0;
        counter.d = 0;
        #20;

        counter.reset = 0;
        counter.en = 1;
        counter.d = 1;
        #20;

        counter.d = 1;
        #20;

        counter.reset = 1;
        counter.en = 1;
        counter.d = 1;
        #20;

        //****************************************
        //      START OF ZERO ITERATION
        //****************************************

        counter.reset = 0;
        counter.d = 0;
        #20;
        #20;

        counter.reset = 1;
        #20;

        //****************************************
        //      START OF ONE ITERATION
        //****************************************

        counter.reset = 0;
        counter.d = 1;
        #20;
        #20;
        #20;
        #20;
        #20;
        #20;

        counter.reset = 0;
        #20;

        //****************************************
        //      STATE 01 RESET VERIFICATION
        //****************************************

        counter.reset = 0;
        counter.d = 1;
        counter.en = 1;
        #20;

        counter.reset = 1;
        #20;

end

initial begin
        $dumpvars;
        $dumpfile("counter.vcd");
end


initial begin           //display output in truth table format
        $display("\tclk\td\ten\treset\tout");
        $monitor("\t%0b\t%0b\t%0b\t%0b\t%02b", counter.clk, counter.d, counter.en, counter.reset, counter.out);
end

initial #320 $finish;   //run test bench for 32 clock cycles (320ns)

endprogram
