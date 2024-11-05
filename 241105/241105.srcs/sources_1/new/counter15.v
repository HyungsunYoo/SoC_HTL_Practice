`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 16:55:32
// Design Name: 
// Module Name: counter15
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


//module counter15(
//    input sw_in,
//    input reset_n,
//    output reg [3:0] led_out
//    );
   
//always@ (posedge sw_in , negedge reset_n) begin
//    if(!reset_n ) led_out <= 4'b0000;
//    else led_out <= led_out +1;
//end
//endmodule

module counter15(
    input clk_in,
    input sw_in,
    input reset_n,
    output reg [3:0] led_out
    );
    wire clk_out;
    wire btn_delay1;
    wire btn_delay2;
    wire btn_toggle_w;
    wire btn_pulse_w;
    
    slow_clock_4Hz (clk_in, clk_out);
    
    assign btn_toggle_w = ~sw_in ;
    dff #(.DATA_WIDTH(1)) DFF1 (.clk_i(clk_out), .rst_ni(reset_n), .d_i(btn_toggle_w), .q_o(btn_delay1));
    dff #(.DATA_WIDTH(1)) DFF2 (.clk_i(clk_out), .rst_ni(reset_n), .d_i(btn_delay1), .q_o(btn_delay2));
    assign btn_pulse_w = ((btn_delay1 == 1'b1)&(btn_delay2 == 1'b0)) ? 1'b1 : 1'b0;
    
    always@ (posedge clk_out , negedge reset_n) begin
        if(!reset_n ) led_out <= 4'b0000;
        else begin
            if(btn_pulse_w)
                led_out <= led_out + 1;
        end
    end
endmodule