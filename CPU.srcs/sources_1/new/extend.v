`timescale 1ns / 1ps

module extend(
    input [15:0] imm,//16λ������
    input flag,//�����ź�
    output [31:0] q//��չ���32λ������
    );
    assign q = {flag&&imm[15]?{16{1'b1}}:{16{1'b0}},imm};//ֻ��flagΪ1�������������λΪ1����λ�Ų�1������0
endmodule
