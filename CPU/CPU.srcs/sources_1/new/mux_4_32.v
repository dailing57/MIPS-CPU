`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 09:02:30
// Design Name: 
// Module Name: mux_4_32
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


module mux_4_32(
    input [1:0] flag,
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    output [31:0] out
    );
    assign out = flag[1]?(flag[0]?d:c):(flag[0]?b:a);
endmodule
