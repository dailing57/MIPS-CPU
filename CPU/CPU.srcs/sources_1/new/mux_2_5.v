`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 09:00:01
// Design Name: 
// Module Name: mux_2_5
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


module mux_2_5(
    input flag,
    input [4:0] a,
    input [4:0] b,
    output [4:0] out
    );
    assign out = flag?b:a;
endmodule
