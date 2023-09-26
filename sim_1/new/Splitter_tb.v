module Splitter_tb();
reg [4:0] number;
wire [3:0] b1;
wire [3:0] b2;

Splitter S(.number(number), .b1(b1), .b2(b2));

initial begin 
number = 5'd15;
#100
number = 5'd1;
#100
number = 5'd29;
end
endmodule