//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
	input clk,
	input rst,
	input button,
	

	output[2:0]colour
    );
	reg[2:0]colour;


	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			colour = 1;
		end
		else if ((button == 1) && (colour == 6)) begin
			colour <= 1;
		end
		else if (button ==1) begin
			colour <= colour + 1;
		end
	end







endmodule




