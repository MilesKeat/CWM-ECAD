//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
 parameter CLK_PERIOD = 10;
 reg clk;
 reg [4:0] temperature;
 reg [1:0]state;
 reg [1:0]state_prev;
 reg sett;
wire heating;
wire cooling;
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
state_prev = 00;
temperature = 16;
state = 00;
sett = 1;
#CLK_PERIOD
sett = 0;
forever begin
 state_prev = (heating<<1+cooling);
 #CLK_PERIOD
 state = (heating<<1+cooling);
 if ((temperature >= 22) && (state_prev == 2'b00)) begin 
 if (state != 2'b01)begin
 $display("***TEST FAILED! did not switch correct ***");
           err=1;
 end 
 end 
 if ((temperature >= 20) && (state_prev == 2'b10)) begin 
 if (state != 2'b00)begin
 $display("***TEST FAILED! did not switch correct ***");
           err=1;
 end
 end 
 if ((temperature <= 18) && (state_prev == 2'b00)) begin 
 if (state != 2'b10)begin
 $display("***TEST FAILED! did not switch correct ***");
           err=1;
 end
 end 
 if ((temperature <=20) && (state_prev == 2'b01)) begin 
 if (state != 2'b00)begin
 $display("***TEST FAILED! did not switch correct ***");
           err=1;
 end
 end 
 

 if (temperature < 23) begin
 temperature = temperature + 3;
 end
 else begin
 temperature = temperature - 6;
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
.temperature (temperature),
.heating (heating),
.cooling (cooling),
.sett (sett)
);
endmodule 
