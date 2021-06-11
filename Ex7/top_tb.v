//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
module top_tb(
    );
parameter CLK_PERIOD = 10;
reg clk;
reg sel;
reg rst;
reg enable;
reg button;
wire [23:0]light;
reg err = 0;

  initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

initial begin 
clk = 0;
err = 0;
enable = 0;
rst = 1;
sel = 1;

#CLK_PERIOD
#CLK_PERIOD
#CLK_PERIOD
#CLK_PERIOD

if (rst) begin
 if (light != 24'b0) begin
    $display("***TEST FAILED! did not reset correct ***");
           err=1;
end
end
sel = 0;
#CLK_PERIOD
#CLK_PERIOD
#CLK_PERIOD
#CLK_PERIOD

if (sel) begin
 if (light != 6'hFFFFFF) begin
  $display("***TEST FAILED! sel does not work ***");
           err=1;
end
end
end
three_system top ( 
.clk (clk),
.sel (sel),
.rst (rst),
.button (button),
.light (light),
.enable (enable)
);

endmodule


