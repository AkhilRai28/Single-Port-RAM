`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 17:08:27
// Design Name: 
// Module Name: module_design
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


// Single Port RAM module design

module module_design(
  input [7:0] data, //input data
  input [5:0] addr, //address
  input we, //write enable
  input clk, //clk
  output [7:0] q //output data
);
  
  reg [7:0] ram [63:0]; //8*64 bit ram
  reg [5:0] addr_reg; //address register
 
  always @ (posedge clk)
    begin
      if(we)
        ram[addr] <= data;
      else
        addr_reg <= addr; 
    end
 
  assign q = ram[addr_reg];
  
endmodule
