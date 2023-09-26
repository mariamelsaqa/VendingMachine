module MUX(input [6:0]in1, in2, input sel , output reg [6:0] inseg );

always @(in1,in2,sel) begin
if(sel)
inseg = in2;
else
inseg = in1;
end
endmodule