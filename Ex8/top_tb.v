//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
module top_tb(
    );
 parameter CLK_PERIOD = 10;
 reg clk;
 reg [4:0] temperature;
 reg sett;
 wire heating;
 wire cooling;
 reg err;
 reg heating_prev;
 reg cooling_prev;


  initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

initial begin
err = 0;
clk = 0;
temperature = 0;
sett = 1;
#CLK_PERIOD
sett = 0;
forever begin
 #CLK_PERIOD
 if ((temperature >= 22) && (heating_prev ==  0 && cooling_prev == 0 )) begin 
 if ((heating != 0) || (cooling!= 1))begin
 $display("***TEST FAILED! did not switch correct ***");
           err=1;
 end 
 end 
 if ((temperature >= 20) && (heating_prev ==  1 && cooling_prev == 0 )) begin 
 if (temperature >= 22) begin
 if ((heating != 0) || (cooling!= 1))begin
$display("***TEST FAILED! did not switch correct ***");
           err=1;
end
end
 else if ((heating != 0) || (cooling!= 0)) begin
 $display("***TEST FAILED! did not switch correct ***");
           err=1;
 end
end
 if ((temperature <= 18) && ((heating_prev ==  0 && cooling_prev == 0 ))) begin 
 if ((heating != 1) || (cooling!= 0))begin
 $display("***TEST FAILED! did not switch correct ***");
           err=1;
 end
 end 
 if ((temperature <=20) && (heating_prev ==  0 && cooling_prev == 1 )) begin 
 if ((heating != 0) || (cooling!= 0))begin
 $display("***TEST FAILED! did not switch correct ***");
           err=1;
 end
 end 
 

 if (temperature < 18) begin
 temperature = temperature + 9;
 end
 else begin
 temperature = temperature - 2;
 end
 heating_prev = heating;
 cooling_prev = cooling;
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
);
endmodule 
