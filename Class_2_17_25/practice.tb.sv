program practice_test(practice_io.TB practice);


//generalized monitoring
initial 
	begin
		$dumpfile("test.vcd");
		$dumpvars;
		$display("Interface connected");
end

task reset();
	practice.reset<=1'b0;
	repeat (3)@practice.cb;
	practice.reset<=1'b1;
endtask

task zero();
practice.w<=0;
repeat(1)@practice.cb;
endtask

task one();
practice.w<=1;
repeat(1)@practice.cb;
endtask

task two();
repeat(1)@practice.cb;
endtask

initial
begin
$display("time to reset");
reset();
$display("reset done");

$display("z= %d", practice.z);
practice.w<=0;
$display("z= %d", practice.z);
repeat(6)@practice.cb;
$display("z= %d", practice.z);

reset();
zero();
zero();
zero();
zero();
zero();
zero();
zero();
zero();

reset();
zero();
one();
one();
one();
one();
zero();
zero();
one();
reset();

// exhastive, reach the end
zero();
one();
one();
zero();
zero();
one();
one();
zero();
reset();

zero();
one();
one();
zero();
zero();
one();
one();
reset();

zero();
one();
one();
zero();
zero();
one();
reset();

zero();
one();
one();
zero();
zero();
reset();

zero();
one();
one();
zero();
zero();
reset();

zero();
one();
one();
zero();
reset();

zero();
one();
one();
reset();

zero();
one();
reset();

zero();
reset();

reset();
reset();

two();
reset();
// second struct, reach the end again
zero();
one();
one();
zero();
zero();
one();
one();
one();
reset();

zero();
one();
one();
zero();
zero();
one();
zero();
reset();

zero();
one();
one();
zero();
zero();
zero();
reset();

zero();
one();
one();
zero();
one();
reset();

zero();
one();
one();
zero();
one();
reset();

zero();
one();
one();
one();
reset();

zero();
one();
zero();
reset();

zero();
zero();
reset();

one();
reset();

reset();
reset();


end

//end

endprogram




