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
    input [31:0] din,//要写入存储器的数据
    input [31:0] addr,//要读或写的存储单元地址
    input we,//写使能信号，为1时写存储器，为0时读存储器
    input clk,//时钟信号
    input clrn,//复位信号
    output [31:0] dout//存储器输出数据
    );
    
    
    reg [8:0] data[0:255]; //256个8位存储单元，用于实现存储器功能
    integer i;
    
    assign dout = (addr<= 32'd256)?{data[addr],data[addr+1],data[addr+2],data[addr+3]}:{32{1'bz}};//否则读存储器,如果地址超范围，则输出高阻态
    always @(negedge clrn, posedge clk)
    begin
        if(!clrn)//若clrn=0,则复位，将指令写入存储器，同时将剩余的存储单元复位
        begin
            i = 0;//存储单元宽度为8位，故32位的指令存放在4个存储单元中
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
                {data[addr],data[addr+1],data[addr+2],data[addr+3]} = din;//clrn = 1，we = 1，则写存储器
            end
        end
    end
endmodule
