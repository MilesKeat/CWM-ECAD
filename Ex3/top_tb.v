//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
reg clk;
reg rst;
reg on_off;
reg change;
reg [7:0]counter_out;
reg [7:0]counter_out_prev;
reg err;

//Todo: Clock generation

  initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
initial begin
 err = 0;
 clk = 0;
 rst = 1;
 on_off = 1;
 change = 0;
 counter_out = 0;
 counter_out_prev = counter_out;

if (rst) begin
 if (counter_out != 0) begin
    $display("***TEST FAILED! did not reset correct ***");
           err=1;
 end
end 
rst = 0;
 forever begin
  #CLK_PERIOD


  if ((change)==1) begin
  if ((on_off)==1) begin
  if (counter_out != counter_out_prev + 1) begin
   $display("***TEST FAILED! did not add correct ***");
           err=1;
  end
  end
  end
  
  if ((change)==1) begin
  if ((on_off)==0) begin
  if (counter_out != counter_out_prev - 1) begin
   $display("***TEST FAILED! did not subtract correct ***");
           err=1;
  end
  end
  end

  counter_out_prev = counter_out;
  change=~change;
  if (on_off >= 4) begin
   on_off = 0;
  end 
  if (on_off <= 2) begin
   on_off = 1;
  end

 end
end

//Todo: Finish test, check for success

initial begin 
 #50
 if (err == 0)begin
  $display("***TEST PASSED! :) ***");
  end
 $finish;
end

//Todo: Instantiate counter module
 
monitor top (
.clk (clk),
.rst (rst),
.on_off (on_off),
.change (change),
.counter_out (counter_out[7:0])
);
endmodule 
