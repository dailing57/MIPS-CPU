`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/22 16:36:02
// Design Name: 
// Module Name: regfile
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


module regfile(
    input [4:0] address_rs,//rs寄存器地址
    input [4:0] address_rt,//rt寄存器地址
    input [4:0] write_reg_address,//写寄存器时寄存器的地址
    input [31:0] write_data,//写寄存器的值
    output [31:0] data_rs,//rs寄存器的值
    output [31:0] data_rt,//rt寄存器的值
    input we,//寄存器写使能信号
    input clrn,//复位信号
    input clk//时钟信号
    );
    
    
    reg[31:0] register[1:31];//31个32位寄存器，0号寄存器一直为0
    assign data_rs = address_rs?register[address_rs]:0;//读取rs寄存器，由于0号寄存器一直为0，故若取0号寄存器的值，则输出0，否则读取对应寄存器的值
    assign data_rt = address_rt?register[address_rt]:0;//读取rt寄存器，由于0号寄存器一直为0，故若取0号寄存器的值，则输出0，否则读取对应寄存器的值
    integer i;
    always @(negedge clrn,posedge clk)
    begin
        if(!clrn) for(i = 1;31 >= i;i= i + 1) register[i] <= 0;//clrn = 0,复位
        else if(we&&write_reg_address) register[write_reg_address] <= write_data;//0号寄存器不允许写入，故当we = 1,clrn = 1,r>0时才将数据写入寄存器r
    end
endmodule
