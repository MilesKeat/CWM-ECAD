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
reg err;
wire out;

//Todo: Clock generation

//Todo: User logic
    
//Todo: Finish test, check for success

//Todo: Instantiate counter module
 
endmodule 
