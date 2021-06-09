//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
);

parameter CLK_PERIOD = 10;


reg clk;
reg rst;
reg button;
wire [2:0]colour;
reg [2:0]colour_prev;
reg err;


 initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

initial begin
 err = 0;
 clk = 0;
 rst = 1;
 button = 0;
 colour_prev = 1;

#CLK_PERIOD

if (rst) begin
 if (colour != 1) begin
    $display("***TEST FAILED! did not reset correct ***");
           err=1;
end
end

rst = 0;
 forever begin
  #CLK_PERIOD

if (button == 1) begin
if ((colour != colour_prev+1) && (colour_prev != 6) && (colour != 1)) begin
$display("***TEST FAILED! did not shift correct ***");
           err=1;
end
end

button =~ button;
colour_prev = colour;


end
end

initial begin 
 #200
 if (err == 0)begin
  $display("***TEST PASSED! :) ***");
  end
 $finish;
end

monitor top (
.clk (clk),
.rst (rst),
.button (button),
.colour (colour)
);
endmodule 





 


 
