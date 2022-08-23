`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 08:56:25
// Design Name: 
// Module Name: mux_2
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


module mux_2(
    input flag,//数据选择信号
    input [31:0] a,//32位数据
    input [31:0] b,//32位数据
    output [31:0] out//选择后的数据
    );
    assign out = flag?b:a;//选择信号为1时，选择输出数据b，否则选择输出数据a
endmodule
