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
    input clk,//ʱ���ź�
    input reset,//��λ�ź�
    input [31:0] next_addr,//����ָ���ַnext_addr
    input pcwre,//�����ź�pcwre��ʱ�ӱ��ص���ʱΪ0ʱPC�����ģ�Ϊ1ʱPC���ġ�
    output reg [31:0] pc//��ǰָ���ַpc 
    );
    always @(negedge reset, posedge clk)//ʱ���������ػ���reset�ź��½��ش���
    begin
        if(reset == 0) pc <= 0;// reset = 0 -> pc��λ
        else if(pcwre) pc <= next_addr;//reset != 0, pcwre = 1 -> pc ����
    end
endmodule
