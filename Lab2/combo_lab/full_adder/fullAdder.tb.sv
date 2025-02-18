//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: 15 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 2
// Lab due date: Monday 17 February 2025
//
// Purpose of program: Test Bench for single full adder unit.
//
// Additional files needed: fullAdder.sv, fullAdder.top_io.sv
//
// Date of last modification: 17 February 2025 @ 17:48
//************************************************************************

program fullAdder_testbench(fullAdder_io.TB fullAdder);
                        //******************************
                        //      boilerplate to connect fullAdder
                        //      to the device-under-test
                        //******************************

initial begin
        fullAdder.a = 0;               //initializing a, b, and cin as zero
        fullAdder.b = 0;
        fullAdder.carryIn = 0;
end

initial begin
        #5 fullAdder.carryIn = 1;                              //truth table of test cases
        #5 fullAdder.carryIn = 0; fullAdder.b = 1;                    //c-in oscillates ever 5ns
        #5 fullAdder.carryIn = 1;                              //b every 10ns
        #5 fullAdder.carryIn = 0; fullAdder.b = 0; fullAdder.a = 1;          //a after 20ns
        #5 fullAdder.carryIn = 1;
        #5 fullAdder.carryIn = 0; fullAdder.b = 1;
        #5 fullAdder.carryIn = 1;
end

initial begin                                   //------------------------
        $dumpfile("fullADDTest.vcd");           // boilerplate to dump vcd
        $dumpvars;                              //
        $display("Interface connected");        // and display TT output
end                                             //-------------------------

initial begin
        $display("a,\tb,\tcIn,\tcout,\tsum");
        $monitor ("%0h\t%0h\t%0h\t%0h\t %0h", fullAdder.a, fullAdder.b, fullAdder.carryIn, fullAdder.carry, fullAdder.sum);
end

initial #45 $finish;    //run for 45ns then finish
endprogram
