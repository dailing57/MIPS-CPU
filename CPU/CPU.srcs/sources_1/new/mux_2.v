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
    input flag,//����ѡ���ź�
    input [31:0] a,//32λ����
    input [31:0] b,//32λ����
    output [31:0] out//ѡ��������
    );
    assign out = flag?b:a;//ѡ���ź�Ϊ1ʱ��ѡ���������b������ѡ���������a
endmodule
