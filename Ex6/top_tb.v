//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
module top_tb(
    );
parameter CLK_PERIOD = 10;

reg clk;
reg [2:0]colour;
reg enable;
reg err;

wire [23:0]rgb;

  initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

initial begin 
err = 0;
clk = 0;
colour = 0;
enable = 1;

forever begin
#CLK_PERIOD
if ((colour[0:0]<<8-colour[0:0]!=rgb[1:0]) || (colour[1:1]<<8-colour[1:1]!=rgb[3:2]) ||  (colour[2:2]<<8-colour[2:2]!=rgb[3:2])) begin 
$display("***TEST FAILED! did not subtract correct ***");
           err=1;
end
enable =~ enable;
if (enable == 1) begin
colour = colour+1;
end
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
.enable (enable),
.colour (colour),
.rgb (rgb)
);
endmodule 
