//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module doorbell(
    //Todo: define inputs here
    input [23:0]rgb,
    input clk, sel, rst, button, enable,
    output [23:0]light
    );
    
    //Todo: define registers and wires here

    reg [23:0]light;
	
    //Todo: define your logic here

always begin
    if (sel) begin
     light = rgb ;
    end
    else begin
      light = 6'hFFFFFF;
    end        
end

stage1 lights (
.clk (clk),
.rst (rst),
.button (button),
.colour (colour)
);

stage2 converter (
.clk (clk),
.enable (enable),
.colour (colour),
.rgb (rgb)
);



endmodule


