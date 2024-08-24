`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 17:09:29
// Design Name: Testbench for Single Port RAM
// Module Name: tb_single_port_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for Single Port RAM module to verify correct read and write operations.
// 
// Dependencies: single_port_ram module
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module tb_single_port_ram;

    // Testbench signals
    reg [7:0] data;       // 8-bit input data
    reg [7:0] addr;       // 8-bit address
    reg we;               // Write enable signal
    reg clk;              // Clock signal
    wire [7:0] q;         // 8-bit output data
    
    // Instantiate the Single Port RAM module
    single_port_ram uut (
        .data(data),
        .addr(addr),
        .we(we),
        .clk(clk),
        .q(q)
    );
    
    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;  // 10ns clock period
    end
    
    // Testbench stimulus
    initial begin
        // Open VCD file for waveform dump
        $dumpfile("single_port_ram_tb.vcd");
        $dumpvars(0, tb_single_port_ram);
        
        // Initialize values
        data = 8'h00;
        addr = 8'd0;
        we = 1'b0;
        
        // Test case 1: Write data to the first three addresses
        we = 1'b1;  // Enable write
        data = 8'h11; addr = 8'd0; #10;   // Write 0x11 to address 0
        data = 8'h22; addr = 8'd1; #10;   // Write 0x22 to address 1
        data = 8'h33; addr = 8'd2; #10;   // Write 0x33 to address 2
        
        // Test case 2: Read data from the first three addresses
        we = 1'b0;  // Disable write (read mode)
        addr = 8'd0; #10;                 // Read data from address 0
        addr = 8'd1; #10;                 // Read data from address 1
        addr = 8'd2; #10;                 // Read data from address 2
        
        // Test case 3: Write data to non-sequential addresses
        we = 1'b1;  // Enable write
        data = 8'h44; addr = 8'd10; #10;  // Write 0x44 to address 10
        data = 8'h55; addr = 8'd50; #10;  // Write 0x55 to address 50
        
        // Test case 4: Read data from non-sequential addresses
        we = 1'b0;  // Disable write (read mode)
        addr = 8'd10; #10;                // Read data from address 10
        addr = 8'd50; #10;                // Read data from address 50
        
        // Test case 5: Overwrite data at an existing address
        we = 1'b1;  // Enable write
        data = 8'hAA; addr = 8'd1; #10;   // Write 0xAA to address 1
        
        // Test case 6: Read the updated data from address 1
        we = 1'b0;  // Disable write (read mode)
        addr = 8'd1; #10;                 // Read data from address 1
        
        // Test case 7: Write and read to/from the last address in the memory
        we = 1'b1;  // Enable write
        data = 8'hFF; addr = 8'd255; #10; // Write 0xFF to the last address (255)
        
        we = 1'b0;  // Disable write (read mode)
        addr = 8'd255; #10;               // Read data from address 255
        
        // End simulation after 200ns
        #200;
        $finish;
    end
    
endmodule



































































































































































































































































































































































































































































//comment
