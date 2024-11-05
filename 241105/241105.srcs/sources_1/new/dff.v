`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/05 17:08:31
// Design Name: 
// Module Name: dff
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


module dff#(parameter DATA_WIDTH=4)(
    input clk_i,
    input rst_ni,
    input [DATA_WIDTH-1:0] d_i,
    output reg [DATA_WIDTH-1:0] q_o
    );
    
    always@ (posedge clk_i or negedge rst_ni ) begin
        if (!rst_ni)
            q_o <= 0;
        else
            q_o <= d_i ;
    end
endmodule
