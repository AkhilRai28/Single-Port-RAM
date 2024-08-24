`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 17:08:27
// Design Name: Single Port RAM
// Module Name: single_port_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Single Port RAM module with synchronous write and asynchronous read.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module single_port_ram(
    input [7:0] data,    // 8-bit input data
    input [7:0] addr,    // 8-bit address (increased to 256 locations)
    input we,            // Write enable signal
    input clk,           // Clock signal
    output reg [7:0] q   // 8-bit output data
);
    
    // Declare a 256x8-bit RAM
    reg [7:0] ram [255:0];
    
    // Address register to hold the read address for asynchronous read
    reg [7:0] addr_reg;
    
    // Synchronous write and address capture
    always @(posedge clk) begin
        if (we) begin
            ram[addr] <= data;  // Write data to the memory location at addr
        end
        addr_reg <= addr;       // Update the address register with the current address
    end
    
    // Asynchronous read (output based on the registered address)
    always @(*) begin
        q = ram[addr_reg];      // Output the data from the memory location stored in addr_reg
    end
    
endmodule








































































































































































































//comment
