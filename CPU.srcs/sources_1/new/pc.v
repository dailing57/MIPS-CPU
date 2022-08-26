`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/22 15:28:36
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,//时钟信号
    input reset,//复位信号
    input [31:0] next_addr,//下条指令地址next_addr
    input pcwre,//控制信号pcwre，时钟边沿到来时为0时PC不更改，为1时PC更改。
    output reg [31:0] pc//当前指令地址pc 
    );
    always @(negedge reset, posedge clk)//时钟上升沿沿或者reset信号下降沿触发
    begin
        if(reset == 0) pc <= 0;// reset = 0 -> pc复位
        else if(pcwre) pc <= next_addr;//reset != 0, pcwre = 1 -> pc 更改
    end
endmodule
