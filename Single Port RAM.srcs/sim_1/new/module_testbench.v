`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 17:09:29
// Design Name: 
// Module Name: module_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Single Port RAM testbench

module module_testbench;
  reg [7:0] data; //input data
  reg [5:0] addr; //address
  reg we; //write enable
  reg clk; //clk
  wire [7:0] q; //output data 	
  
  module_design utt1(
    .data(data),
    .addr(addr),
    .we(we),
    .clk(clk),
    .q(q)
  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1, module_testbench);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      data = 8'h01;
      addr = 5'd0;
      we = 1'b1;
      #10;
           
	  data = 8'h02;
      addr = 5'd1;     
      #10;
      
      data = 8'h03;
      addr = 5'd2;     
      #10;
      
      addr = 5'd0;
      we = 1'b0;
      #10;
      
      addr = 5'd1;
      #10;
      
      addr = 5'd2;
      #10;
      
      data = 8'h04;
      addr = 5'd1;
      we = 1'b1;
      #10;
      
      addr = 5'd1;
      we = 1'b0;
      #10;
      
      addr = 5'd3;
      #10;
    end
  
  initial
    #90 $stop;
  
endmodule
