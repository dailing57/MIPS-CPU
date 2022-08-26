`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 08:50:40
// Design Name: 
// Module Name: dff32
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


module dff32(
    input[31:0] d,//待写入数据
    input clk,//时钟信号
    input clrn,//复位信号
    input e,//寄存器写使能信号,为1时允许写入
    output reg [31:0] q//寄存器当前存储数据
    );
    always @ (negedge clrn or posedge clk)
        if (clrn == 0) begin//clrn=0，复位
           q <= 0;
        end else begin
            if (e==1) q <= d;//clrn!=0,写使能信号为1，写入数据
       end
endmodule