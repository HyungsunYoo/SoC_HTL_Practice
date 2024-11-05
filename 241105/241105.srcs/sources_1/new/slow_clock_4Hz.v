`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/05 17:08:31
// Design Name: 
// Module Name: slow_clock_4Hz
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


module slow_clock_4Hz(
    input clk_in,
    output clk_out
    );
    reg [25:0] count = 0;
    reg clk_out = 0;
    
    always@ (posedge clk_in) begin
        count <= count +1;
        if(count==1_250_000) begin
            count <=0;
            clk_out = ~clk_out;
        end
    end
endmodule
