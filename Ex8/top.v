//////////////////////////////////////////////////////////////////////////////////
// Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an air conditioning systems
//
//  inputs:
//           rst_n, clk_n, clk_p, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk_p,
    input clk_n,
     //Todo: add all other ports besides clk_n and clk_p 
    input rst_n,
    input [4:0]temperature, 
    output heating 
    output cooling 
   );
    

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

//Add logic here
reg heating;
reg cooling;
reg [1:0]state;

initial begin

always @ (posedge clk) begin

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
else if (temperature >= 5'b10110) begin
cooling = 1;
end 
end 
else if (state == 2'b11) begin
cooling = 0;
heating = 0;
end 
end

endmodule
