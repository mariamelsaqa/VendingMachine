module edge_detector_tb();
reg clk, reset, level;
wire tick;

Edge_Detector uut(clk,reset,level, tick);

always #5 clk = ~clk;

initial begin
clk = 0;
reset = 1;
level = 0;
#5
clk = 0;
reset = 0;
level = 1;
end
endmodule