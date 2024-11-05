`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 17:02:54
// Design Name: 
// Module Name: tb_counter15
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


module tb_counter15();

reg sw, reset;
wire [3:0] led;

counter15 inst_counter15(
    .sw_in(sw),
    .reset_n(reset),
    .led_out(led)
);

initial begin
    sw=0;
    forever #5 sw = ~sw;
end

initial begin
    reset = 0;
    #15
    reset = 1;
    #300
    reset = 0;
    #20
    reset = 1;
end

endmodule
