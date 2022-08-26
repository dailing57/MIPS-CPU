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
    input[31:0] d,//��д������
    input clk,//ʱ���ź�
    input clrn,//��λ�ź�
    input e,//�Ĵ���дʹ���ź�,Ϊ1ʱ����д��
    output reg [31:0] q//�Ĵ�����ǰ�洢����
    );
    always @ (negedge clrn or posedge clk)
        if (clrn == 0) begin//clrn=0����λ
           q <= 0;
        end else begin
            if (e==1) q <= d;//clrn!=0,дʹ���ź�Ϊ1��д������
       end
endmodule