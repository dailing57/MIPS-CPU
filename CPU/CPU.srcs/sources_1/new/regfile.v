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
    input [4:0] address_rs,//rs�Ĵ�����ַ
    input [4:0] address_rt,//rt�Ĵ�����ַ
    input [4:0] write_reg_address,//д�Ĵ���ʱ�Ĵ����ĵ�ַ
    input [31:0] write_data,//д�Ĵ�����ֵ
    output [31:0] data_rs,//rs�Ĵ�����ֵ
    output [31:0] data_rt,//rt�Ĵ�����ֵ
    input we,//�Ĵ���дʹ���ź�
    input clrn,//��λ�ź�
    input clk//ʱ���ź�
    );
    
    
    reg[31:0] register[1:31];//31��32λ�Ĵ�����0�żĴ���һֱΪ0
    assign data_rs = address_rs?register[address_rs]:0;//��ȡrs�Ĵ���������0�żĴ���һֱΪ0������ȡ0�żĴ�����ֵ�������0�������ȡ��Ӧ�Ĵ�����ֵ
    assign data_rt = address_rt?register[address_rt]:0;//��ȡrt�Ĵ���������0�żĴ���һֱΪ0������ȡ0�żĴ�����ֵ�������0�������ȡ��Ӧ�Ĵ�����ֵ
    integer i;
    always @(negedge clrn,posedge clk)
    begin
        if(!clrn) for(i = 1;31 >= i;i= i + 1) register[i] <= 0;//clrn = 0,��λ
        else if(we&&write_reg_address) register[write_reg_address] <= write_data;//0�żĴ���������д�룬�ʵ�we = 1,clrn = 1,r>0ʱ�Ž�����д��Ĵ���r
    end
endmodule
