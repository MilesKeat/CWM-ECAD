//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
	input clk,
	input [4:0]temperature,
	input sett,

	output heating,
	output cooling

    );
reg heating;
reg cooling;
reg [1:0]state;

always @ (posedge clk) begin
if (sett !=1) begin
heating = 0;
cooling = 0;
end 

state = (heating<<1+cooling);
if (state == 2'b10) begin
if (temperature >= 5'b10100) begin
heating = 0;
end 
end

else if (state == 2'b01) begin
if (temperature <= 5'b10100 ) begin
cooling = 0 ;
end
end 
else if (state == 2'b00) begin
if (temperature <= 5'b10010) begin
heating = 1;
end
if (temperature >= 5'b10110) begin
cooling = 1;
end 
end 
else if (state == 2'b11) begin
cooling = 0;
heating = 0;
end 
end
endmodule 







