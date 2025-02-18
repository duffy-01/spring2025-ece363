//Design for the practice activity

module practice(input w, clk, reset, output z);
parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101, G=3'b110, H=3'b111;
reg [2:0] ps, ns;
reg z;
always@(posedge clk or negedge reset)
begin
if(reset==0)
begin
ps<=A;
end
else
begin
ps<=ns;
end
end

always@(w or ps)
begin
case(ps)
A: begin if(w==0) ns<=B; else ns<=A; end
B: begin if(w==0) ns<=A; else ns<=C; end
C: begin if(w==0) ns<=A; else ns<=D; end
D: begin if(w==0) ns<=E; else ns<=A; end
E: begin if(w==0) ns<=F; else ns<=A; end
F: begin if(w==0) ns<=A; else ns<=G; end
G: begin if(w==0) ns<=A; else ns<=H; end
H: begin if(w==0) ns<=A; else ns<=A; end
default: ns<=A;
endcase
end

always@(ps)
begin
if(ps==H)
begin
z<=1;
end
else
begin
z<=0;
end
end
endmodule
