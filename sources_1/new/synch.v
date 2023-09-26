module synch (input clk, input in, output out);
wire meta;
DFF d4(clk,in,meta);
DFF d5 (clk,meta,out);
endmodule