//*************************************************************************
// Author(s): Shane Duffy
// Creation Date: Friday 5 February 2025
// Class: ECE 363 - Design of Digital Systems
// Lab this program is associated with: Lab 1
// Lab due date: Monday 10 February 2025 @ 12:00AM
//
// Purpose of program: Test Bench for compound 2-bit full adder.
//
// Additional files needed: fullAdder.sv,  ripple2.test_top/if.sv, ripple2.sv  
//
// Date of last modification: 9 February 2025 @ 17:48
//*************************************************************************

program rippleADD_testbench(rippleADD_io.TB rippleADD);


initial begin                           //init a, b, and cin
        rippleADD.a = 2'b00;                            //as 00, 00, and 0
        rippleADD.b = 2'b00;
        rippleADD.carryIn = 0;
end

initial begin                            //queue the truth table style of test case iteration
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b01;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b10;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b11;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b00; rippleADD.b = 2'b01;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b01;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b10;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b11;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b00; rippleADD.b = 2'b10;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b01;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b10;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b11;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b00; rippleADD.b = 2'b11;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b01;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b10;
        #5 rippleADD.carryIn = 1;
        #5 rippleADD.carryIn = 0; rippleADD.a = 2'b11;
        #5 rippleADD.carryIn = 1;
end

initial begin                           //----------------------
        $dumpfile("rippleADDTest.vcd"); // Dumpfile and TT
        $dumpvars;                      // output boilerplate
end                                     //
                                        //---------------------
initial begin
        $display("\ta,\tb,\tcIn,\tcout,\tsum");
        $monitor ("\t%02b\t%02b\t%0b\t%0b\t%02b", rippleADD.a, rippleADD.b, rippleADD.carryIn, rippleADD.carry, rippleADD.sum);
end

initial #160 $finish;   // run for 160ms, then finish
endprogram
