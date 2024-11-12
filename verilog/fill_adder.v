module fulladder_struct(S,Cout,A,B,Cin);
	input A,B,Cin;
	output S,Cout;
	wire s1,c1,c2;
	ha HA1(s1,c1,A,B);
	ha HA2(S,c2,s1,Cin);
	or O1(Cout,c1,c2);
endmodule;

module ha(s,c,a,b);
input a,b;
output s,c;
assign s = a^b;
assign c= a&b;
endmodule


//TestBench
`timescale 1ns/1ps
module testadder;
reg A,B,Cin,s1,c1,c2;
wire S,Cout;
fulladder_struct FA1(S,Cout,A,B,Cin);
initial
begin

A=1'b0; B=1'b0; Cin=1'b0;
#1 A=1'b0; B=1'b0; Cin=1'b1;
#1 A=1'b0; B=1'b1; Cin=1'b0;
#1 A=1'b0; B=1'b1; Cin=1'b1;
#1 A=1'b1; B=1'b0; Cin=1'b0;
#1 A=1'b1; B=1'b0; Cin=1'b1;
#1 A=1'b1; B=1'b1; Cin=1'b0;
#1 A=1'b1; B=1'b1; Cin=1'b1;
end
endmodule