module Splitter (input [4:0] number, output reg[3:0] b1,output reg[3:0]b2);
always @ (number)
begin
b1 = number[4:0] % 4'b1010;
b2 = (number[4:0]/4'b1010) % 4'b1010;
end
endmodule
