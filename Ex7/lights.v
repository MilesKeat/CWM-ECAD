
`timescale 1ns / 100ps

module stage1 (
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
