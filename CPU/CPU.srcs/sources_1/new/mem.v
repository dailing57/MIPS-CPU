`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/22 16:18:51
// Design Name: 
// Module Name: mem
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

module mem(
    input [31:0] din,//Ҫд��洢��������
    input [31:0] addr,//Ҫ����д�Ĵ洢��Ԫ��ַ
    input we,//дʹ���źţ�Ϊ1ʱд�洢����Ϊ0ʱ���洢��
    input clk,//ʱ���ź�
    input clrn,//��λ�ź�
    output [31:0] dout//�洢���������
    );
    
    
    reg [8:0] data[0:255]; //256��8λ�洢��Ԫ������ʵ�ִ洢������
    integer i;
    
    assign dout = (addr<= 32'd252)?{data[addr],data[addr+1],data[addr+2],data[addr+3]}:{32{1'bz}};//������洢��,�����ַ����Χ�����������̬
    always @(negedge clrn, posedge clk)
    begin
        if(!clrn)//��clrn=0,��λ����ָ��д��洢����ͬʱ��ʣ��Ĵ洢��Ԫ��λ
        begin
            i = 0;//�洢��Ԫ���Ϊ8λ����32λ��ָ������4���洢��Ԫ��
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h24010008;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h34020002;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h38430008;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00612022;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00822824;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00052880;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h10A1FFFE;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h0C000014;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h01A1402A;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h240EFFFE;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h010E482A;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h292A0002;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h294B0000;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h016A5820;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h1562FFFE;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h240CFFFE;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h258C0001;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h0580FFFE;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h304C0002;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h08000017;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'hAC220004;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h8C2D0004;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h03E00008;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00824025;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00411821;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00622823;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h20010008;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00824026;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00824027;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00084043;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00084042;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h0082402B;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h2C010008;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h241F0098;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00624004;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00624006;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00624007;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h3C020002;
            i = i+4;
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'hFC000000;
            i = i+4;
            for(i=i;i<256;i = i + 1) data[i]=32'b0;
        end
        else begin
            if(we)
            begin
                {data[addr],data[addr+1],data[addr+2],data[addr+3]} = din;//clrn = 1��we = 1����д�洢��
            end
        end
    end
endmodule
