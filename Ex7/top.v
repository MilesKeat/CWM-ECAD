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

module three_system (
input clk, sel, rst, button, enable,
output light
);
reg [23:0]light;
reg [2:0]colourtemp;
reg [23:0]rgbtemp;

always begin
lights stage1(clk,rst,button,colourtemp);
converter stage2(clk, colourtemp, enable, rgbtemp);
doorbell stage3(white, rgbtemp, sel, light);
end

endmodule

module doorbell(
    //Todo: define inputs here
    input [23:0]white,
    input [23:0]rgb,
    input sel,
    output out
    );

    //Todo: define registers and wires here
    reg out;
	
    //Todo: define your logic here
   always begin 
    if(sel)
     out <= rgb;
    else
     out <= white;
    end
                      
      
endmodule

module lights (
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

module converter (
input clk,
input [2:0]colour,
input enable,



output [23:0]rgb 
);


blk_mem_gen_0 your_instance_name (
  .clka(clk),    // input wire clka
  .ena(enable),      // input wire ena
  .wea(0),      // input wire [0 : 0] wea
  .addra(colour),  // input wire [2 : 0] addra
  .dina(24'b0),    // input wire [23 : 0] dina
  .douta(rgb)  // output wire [23 : 0] douta
);

endmodule
