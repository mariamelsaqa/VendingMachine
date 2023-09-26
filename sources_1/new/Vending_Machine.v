module Vending_Machine(input clk,input RxD, output [6:0] out, output [3:0] en, output reg indicator);
wire A,B,C,S,R;
wire As,Bs,Cs,Ss,Rs;
wire Ad,Bd,Cd,Sd,Rd;
wire one, five, ten, stop, reset;
wire clk_out;
wire count;
wire [6:0] bcd_out1;
wire [6:0] bcd_out2;
wire [3:0] b1;
wire [3:0] b2;
wire[4:0] number;
wire water_indicator;
wire w,x,y;
wire[4:0] outLED;

Clock_Divider #(500000) cd (clk, 1'b0, clk_out);

UART #(8'd97)U1 (clk, RxD,out1, A);
UART #(8'd98)U2 (clk, RxD,out2, B);
UART #(8'd99)U3 (clk, RxD,out3, C);
UART #(8'd115)U4 (clk, RxD,out4, S);
UART #(8'd114)U5 (clk, RxD,out5, R);

synch s1 (clk_out,A,As);
synch s2 (clk_out,B,Bs);
synch s3 (clk_out,C,Cs);
synch s4 (clk_out,S,Ss);
synch s5 (clk_out,R,Rs);

Debouncer d1 (clk_out,As,Ad);
Debouncer d2 (clk_out,Bs,Bd);
Debouncer d3 (clk_out,Cs,Cd);
Debouncer d4 (clk_out,Ss,Sd);
Debouncer d5 (clk_out,Rs,Rd);

Edge_Detector e1 (clk, 1'b0, Ad, one);
Edge_Detector e2 (clk, 1'b0, Bd, five);
Edge_Detector e3 (clk, 1'b0, Cd, ten);
Edge_Detector e4 (clk, 1'b0, Sd, stop);
Edge_Detector e5 (clk, 1'b0, Rd, reset);

fsm f (one,five,ten,stop,reset,clk,number,water_indicator,w,x,y,outLED);

always @(water_indicator)begin
if(water_indicator == 1'b1)
begin
indicator <= 1;
end
else
begin
indicator <= 0;
end
end

Splitter Sp (number, b1, b2);

Binary_Counter #(1) bc (clk_out, 1'b0,1'b0,1'b0, count);

BCD bcd1 (b1, 1'b1, bcd_out1);
BCD bcd2 (b2, 1'b1, bcd_out2);

Decoder d (count, en);

MUX M (bcd_out1, bcd_out2, count, out);

endmodule