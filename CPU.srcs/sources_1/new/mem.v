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
    
    assign dout = (addr<= 32'd256)?{data[addr],data[addr+1],data[addr+2],data[addr+3]}:{32{1'bz}};//������洢��,�����ַ����Χ�����������̬
    always @(negedge clrn, posedge clk)
    begin
        if(!clrn)//��clrn=0,��λ����ָ��д��洢����ͬʱ��ʣ��Ĵ洢��Ԫ��λ
        begin
            i = 0;//�洢��Ԫ���Ϊ8λ����32λ��ָ������4���洢��Ԫ��
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h3c010000; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h34240080; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h20050004; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h0c000018; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'hac820000; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h8c890000; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h01244022; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h20050003; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h20a5ffff; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h34a8ffff; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h39085555; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h2009ffff; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h312affff; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h01493025; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h01494126; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h01463824; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h10a00001; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h08000008; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h2005ffff; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h000543c0; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00084400; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00084403; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h000843c2; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h08000017; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00004020; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h8c890000; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h20840004; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h01094020; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h20a5ffff; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h14a0fffb; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00081000; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h03e00008; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h000000A3; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00000027; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00000079; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00000115; 
            i = i + 4; 
            {data[i+0],data[i+1],data[i+2],data[i+3]} = 32'h00000000; 
            i = i + 4; 
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
