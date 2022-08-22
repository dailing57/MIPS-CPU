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
    
    assign dout = (addr<= 32'd252)?{data[addr],data[addr+1],data[addr+2],data[addr+3]}:{32{1'bz}};//否则读存储器,如果地址超范围，则输出高阻态
    always @(negedge clrn, posedge clk)
    begin
        if(!clrn)//若clrn=0,则复位，将指令写入存储器，同时将剩余的存储单元复位
        begin
            i = 0;//存储单元宽度为8位，故32位的指令存放在4个存储单元中
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
                {data[addr],data[addr+1],data[addr+2],data[addr+3]} = din;//clrn = 1，we = 1，则写存储器
            end
        end
    end
endmodule
