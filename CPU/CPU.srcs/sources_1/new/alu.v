`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/22 18:13:50
// Design Name: 
// Module Name: alu
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

module alu(
    input [31:0] a,//32λ�������
    input [31:0] b,//32λ�Ҳ�����
    input [3:0] aluc,//������
    output reg [31:0] result,//������
    output zero,//���־λ����resultΪ��ʱΪ1,����Ϊ0��
    output sign,//���ű�־λ����result�����λΪ1ʱΪ1������Ϊ0��
    output reg OF,//��λ��־λCF�������мӣ�����������ʱ�������λ��ǰ�н����裩λʱΪ1������Ϊ0��
    output reg CF,//�����־λOF�������мӣ�����������ʱ���������������˴��������ķ�ΧΪ1������Ϊ0��
    output PF//��ż��־λPF����result��"1"�ĸ���Ϊż��ʱΪ1������Ϊ0��
    );
    assign zero = result == 0;//���־,
    assign sign = result[31];//���ű�־
    assign PF = ~^result;//��ż��־��PF��ż����1����PF=1������Ϊ0
    always @(a,b,aluc) 
        begin
        CF = 0;OF = 0;//OF��CF��־λĬ��Ϊ0
        case(aluc)
            4'b0000 : begin 
                {CF,result} = a + b;//a+b,�����������CF��־λ��λ
                OF = a[31]==b[31]&&a[31]!=result[31];//�з������ӷ����㣬�����з���������λ��ͬ������������λ�෴���������,OF��λ
            end
            4'b0001 : begin 
                {CF,result} = a - b;//a-b,�����������CF��־λ��λ
                OF = a[31]!=b[31]&&a[31]!=result[31];//�з����������㣬�����з���������λ��ͬ������������λ�෴���������,OF��λ
            end
            4'b0010 : result = b << a;//b����aλ
            4'b0011 : result = a | b;//a��b
            4'b0100 : result = a & b;//a��b����
            4'b0101 : result = a < b;//�޷�����a���޷�����b�Ƚϣ�a<bʱ���1,�������0
            4'b0110 : result = (((a<b) && (a[31] == b[31] )) ||( ( a[31] == 1 && b[31] == 0)));//������a�������b�Ƚϣ�a<bʱ���1,�������0
            4'b0111 : result = a ^ b;//a���b
            4'b1000: result = ~(a | b);//a���b
            4'b1001: result = b << 16;//b����16λ
            4'b1010: result = ((b >> a)|({32{b[31]}}<<(32-a)));//b��������aλ,��λ������λ
            4'b1011: result = b >> a;//b�߼�����aλ,��λ��0
            default: result = 0;//ȱʡ����Ϊ ���0
        endcase
        end
endmodule
