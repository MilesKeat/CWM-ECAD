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
 clk = 0;
 rst = 0;
 on_off = 0;
 change = 0;
 counter_out = 0;
 counter_out_prev = counter_out;

 forever begin
  #CLK_PERIOD

  if (rst)
  begin
   if (counter_out != 0) 
   begin 
    $display("***TEST FAILED! did not reset correct ***");
           err=1;
    end

  else if ((change) && (on_off)) && (counter_out != counter_out_prev + 1))
  begin
   $display("***TEST FAILED! did not add correct ***");
           err=1;
  end
  
  else if (change) && (!on_off) && (counter_out != counter_out_prev - 1)
  begin
   $display("***TEST FAILED! did not subtract correct ***");
           err=1;
  end
    

  counter_out_prev = counter_out;
  change=~change;
  if change = 0
   on_off =~ on_off;
  if clk == 10
   rst = 1;
  if clk == 11
   rst = 0;
 end
end

//Todo: Finish test, check for success

initial begin 
 #50
 if err == 0
  $display("***TEST PASSED! :) ***");
 $finish;
end

//Todo: Instantiate counter module
 

.clk (clk)
.rst (rst)
.on_off (on_off)
.change (change)
.counter_out (counter_out)
endmodule 
