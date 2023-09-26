module Decoder(input in, output [3:0]out);
assign out[0]= ~(~in);
assign out[1]= ~(in);
assign out[2]= 1;
assign out[3]= 1;
endmodule