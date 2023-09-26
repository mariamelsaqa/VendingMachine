module fsm(input one,five,ten, input stop, input reset,input clk, output reg[4:0] number,output reg water_indicator,output reg w,x,y, output [4:0] outLED);
localparam [4:0]
State_zero = 5'b00000,
State_one = 5'b00001,
State_two = 5'b00010,
State_three = 5'b00011,
State_four = 5'b00100,
State_five = 5'b00101,
State_six = 5'b00110,
State_seven = 5'b00111,
State_eight = 5'b01000,
State_nine = 5'b01001,
State_ten = 5'b01010,
State_eleven = 5'b01011,
State_twelve = 5'b01100,
State_thirteen = 5'b01101,
State_fourteen = 5'b01110,
State_fifteen = 5'b01111,
State_sixteen = 5'b10000,
State_seventeen = 5'b10001,
State_eighteen = 5'b10010,
State_nineteen = 5'b10011,
State_twenty = 5'b10100,
State_twenty_one = 5'b10101,
State_twenty_two = 5'b10110,
State_twenty_three = 5'b10111,
State_twenty_four = 5'b11000,
State_twenty_five = 5'b11001,
State_twenty_six = 5'b11010,
State_twenty_seven = 5'b11011,
State_twenty_eight = 5'b11100,
State_twenty_nine = 5'b11101;

reg [4:0] state = State_zero, next_state = State_zero;

wire clk_out1;
Clock_Divider #(50000000) cd2 (clk, 1'b0, clk_out1); 

wire[4:0] count;
assign outLED = count;
reg reseter;
Binary_Counter #(5) bc2 (clk_out1, reseter,1'b0,1'b0, count);
always @ (*)
begin

if(one || five || ten || stop||reset)
begin
reseter <= 1;
end
else
begin
reseter <= 0;
end

end


always @(*)
begin
case(state)
State_zero: begin
water_indicator <= 1'b0;
//number<= 5'd0;
if(one)
next_state <= State_one;
else if (five)
next_state <= State_five;
else if (ten)
next_state <= State_ten;
else
next_state <= State_zero;
end

State_one: begin
water_indicator <= 1'b0;
//number<= 5'd1;
if(one)
next_state <= State_two;
else if (five)
next_state <= State_six;
else if (ten)
next_state <= State_eleven;
else
next_state <= State_one;
end

State_two: begin
water_indicator <= 1'b0;
//number<= 5'd2;
if(one)
next_state <= State_three;
else if (five)
next_state <= State_seven;
else if (ten)
next_state <= State_twelve;
else
next_state <= State_two;
end

State_three: begin
water_indicator <= 1'b0;
//number<= 5'd3;
if(one)
next_state <= State_four;
else if (five)
next_state <= State_eight;
else if (ten)
next_state <= State_thirteen;
else
next_state <= State_three;
end

State_four: begin
water_indicator <= 1'b0;
//number<= 5'd4;
if(one)
next_state <= State_five;
else if (five)
next_state <= State_nine;
else if (ten)
next_state <= State_fourteen;
else
next_state <= State_four;
end

State_five: begin
water_indicator <= 1'b0;
//number<= 5'd5;
if(one)
next_state <= State_six;
else if (five)
next_state <= State_ten;
else if (ten)
next_state <= State_fifteen;
else
next_state <= State_five;
end

State_six: begin
water_indicator <= 1'b0;
//number<= 5'd6;
if(one)
next_state <= State_seven;
else if (five)
next_state <= State_eleven;
else if (ten)
next_state <= State_sixteen;
else
next_state <= State_six;
end

State_seven: begin
water_indicator <= 1'b0;
//number<= 5'd7;
if(one)
next_state <= State_eight;
else if (five)
next_state <= State_twelve;
else if (ten)
next_state <= State_seventeen;
else
next_state <= State_seven;
end

State_eight: begin
water_indicator <= 1'b0;
//number<= 5'd8;
if(one)
next_state <= State_nine;
else if (five)
next_state <= State_thirteen;
else if (ten)
next_state <= State_eighteen;
else
next_state <= State_eight;
end

State_nine: begin
water_indicator <= 1'b0;
//number<= 5'd9;
if(one)
next_state <= State_ten;
else if (five)
next_state <= State_fourteen;
else if (ten)
next_state <= State_nineteen;
else
next_state <= State_nine;
end

State_ten: begin
water_indicator <= 1'b0;
//number<= 5'd10;
if(one)
next_state <= State_eleven;
else if (five)
next_state <= State_fifteen;
else if (ten)
next_state <= State_twenty;
else
next_state <= State_ten;
end

State_eleven: begin
water_indicator <= 1'b0;
//number<= 5'd11;
if(one)
next_state <= State_twelve;
else if (five)
next_state <= State_sixteen;
else if (ten)
next_state <= State_twenty_one;
else
next_state <= State_eleven;
end

State_twelve: begin
water_indicator <= 1'b0;
//number<= 5'd12;
if(one)
next_state <= State_thirteen;
else if (five)
next_state <= State_seventeen;
else if (ten)
next_state <= State_twenty_two;
else
next_state <= State_twelve;
end

State_thirteen: begin
water_indicator <= 1'b0;
//number<= 5'd13;
if(one)
next_state <= State_fourteen;
else if (five)
next_state <= State_eighteen;
else if (ten)
next_state <= State_twenty_three;
else
next_state <= State_thirteen;
end

State_fourteen: begin
water_indicator <= 1'b0;
//number<= 5'd14;
if(one)
next_state <= State_fifteen;
else if (five)
next_state <= State_nineteen;
else if (ten)
next_state <= State_twenty_four;
else
next_state <= State_fourteen;
end

State_fifteen: begin
water_indicator <= 1'b0;
//number<= 5'd15;
if(one)
next_state <= State_sixteen;
else if (five)
next_state <= State_twenty;
else if (ten)
next_state <= State_twenty_five;
else
next_state <= State_fifteen;
end

State_sixteen: begin
water_indicator <= 1'b0;
//number<= 5'd16;
if(one)
next_state <= State_seventeen;
else if (five)
next_state <= State_twenty_one;
else if (ten)
next_state <= State_twenty_six;
else
next_state <= State_sixteen;
end

State_seventeen: begin
water_indicator <= 1'b0;
//number<= 5'd17;
if(one)
next_state <= State_eighteen;
else if (five)
next_state <= State_twenty_two;
else if (ten)
next_state <= State_twenty_seven;
else
next_state <= State_seventeen;
end

State_eighteen: begin
water_indicator <= 1'b0;
//number<= 5'd18;
if(one)
next_state <= State_nineteen;
else if (five)
next_state <= State_twenty_three;
else if (ten)
next_state <= State_twenty_eight;
else
next_state <= State_eighteen;
end

State_nineteen: begin
water_indicator <= 1'b0;
//number<= 5'd19;
if(one)
next_state <= State_twenty;
else if (five)
next_state <= State_twenty_four;
else if (ten)
next_state <= State_twenty_nine;
else
next_state <= State_nineteen;
end

State_twenty: begin
water_indicator <= 1'b1;
//number<= 5'd20;
//next_state <= state;
if(stop)
begin
next_state<=State_zero;
end
else
begin
next_state <= state;
end
end

State_twenty_one: begin
water_indicator <= 1'b1;
//number<= 5'd1;
//next_state <= state;
if(stop)
begin
next_state<=State_one;
end
else
begin
next_state <= state;
end
end

State_twenty_two: begin
water_indicator <= 1'b1;
//number<= 5'd2;
//next_state <= state;
if(stop)
begin
next_state<=State_two;
end
else
begin
next_state <= state;
end
end

State_twenty_three: begin
water_indicator <= 1'b1;
//number<= 5'd3;
//next_state <= state;
if(stop)
begin
next_state<=State_three;
end
else
begin
next_state <= state;
end
end

State_twenty_four: begin
water_indicator <= 1'b1;
//number<= 5'd4;
//next_state <= state;
if(stop)
begin
next_state<=State_four;
end
else
begin
next_state <= state;
end
end

State_twenty_five: begin
water_indicator <= 1'b1;
//number<= 5'd5;
//next_state <= state;
if(stop)
begin
next_state<=State_five;
end
else
begin
next_state <= state;
end
end

State_twenty_six: begin
water_indicator <= 1'b1;
//number<= 5'd6;
//next_state <= state;
if(stop)
begin
next_state<=State_six;
end
else
begin
next_state <= state;
end
end

State_twenty_seven: begin
water_indicator <= 1'b1;
//number<= 5'd7;
//next_state <= state;
if(stop)
begin
next_state<=State_seven;
end
else
begin
next_state <= state;
end
end

State_twenty_eight: begin
water_indicator <= 1'b1;
//number<= 5'd8;
//next_state <= state;
if(stop)
begin
next_state<=State_eight;
end
else
begin
next_state <= state;
end
end

State_twenty_nine: begin
water_indicator <= 1'b1;
//number<= 5'd9;
//next_state <= state;
if(stop)
begin
next_state<=State_nine;
end
else
begin
next_state <= state;
end
end

endcase
end

always @ (posedge clk)
begin
state <= next_state;
if(reset)
state <= State_zero;
else 
begin
if(count == 30)
begin
state<=State_zero;
end

case(state)
State_zero: begin
number<= 5'd0;
end

State_one: begin
number<= 5'd1;
end

State_two: begin
number<= 5'd2;
end

State_three: begin
number<= 5'd3;
end

State_four: begin
number<= 5'd4;
end

State_five: begin
number<= 5'd5;
end

State_six: begin
number<= 5'd6;
end

State_seven: begin
number<= 5'd7;
end

State_eight: begin
number<= 5'd8;
end

State_nine: begin
number<= 5'd9;
end

State_ten: begin
number<= 5'd10;
end

State_eleven: begin
number<= 5'd11;
end

State_twelve: begin
number<= 5'd12;
end

State_thirteen: begin
number<= 5'd13;
end

State_fourteen: begin
number<= 5'd14;
end

State_fifteen: begin
number<= 5'd15;
end

State_sixteen: begin
number<= 5'd16;
end

State_seventeen: begin
number<= 5'd17;
end

State_eighteen: begin
number<= 5'd18;
end

State_nineteen: begin
number<= 5'd19;
end

State_twenty: begin
number<= 5'd20;
end

State_twenty_one: begin
number<= 5'd1;
end

State_twenty_two: begin
number<= 5'd2;
end

State_twenty_three: begin
number<= 5'd3;
end

State_twenty_four: begin
number<= 5'd4;
end

State_twenty_five: begin
number<= 5'd5;
end

State_twenty_six: begin
number<= 5'd6;
end

State_twenty_seven: begin
number<= 5'd7;
end

State_twenty_eight: begin
number<= 5'd8;
end

State_twenty_nine: begin
number<= 5'd9;
end

endcase
end
end
always @(*)begin
w<= (state==State_zero);
x<= (state==State_one);
y<= (state==State_two);
end
endmodule
