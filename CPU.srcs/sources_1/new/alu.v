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
    input [31:0] a,//32位左操作数
    input [31:0] b,//32位右操作数
    input [3:0] aluc,//操作码
    output reg [31:0] result,//运算结果
    output zero,//零标志位，当result为零时为1,否则为0。
    output sign,//符号标志位，当result的最高位为1时为1，否则为0。
    output reg OF,//进位标志位CF，当进行加（减）法运算时，若最高位向前有进（借）位时为1，否则为0。
    output reg CF,//溢出标志位OF，当进行加（减）法运算时，若运算结果超出了带符号数的范围为1，否则为0。
    output PF//奇偶标志位PF，当result中"1"的个数为偶数时为1，否则为0。
    );
    assign zero = result == 0;//零标志,
    assign sign = result[31];//符号标志
    assign PF = ~^result;//奇偶标志，PF有偶数个1，则PF=1，否则为0
    always @(a,b,aluc) 
        begin
        CF = 0;OF = 0;//OF、CF标志位默认为0
        case(aluc)
            4'b0000 : begin 
                {CF,result} = a + b;//a+b,若发生溢出则CF标志位置位
                OF = a[31]==b[31]&&a[31]!=result[31];//有符号数加法运算，若两有符号数符号位相同，运算结果符号位相反，则发生溢出,OF置位
            end
            4'b0001 : begin 
                {CF,result} = a - b;//a-b,若发生溢出则CF标志位置位
                OF = a[31]!=b[31]&&a[31]!=result[31];//有符号数法运算，若两有符号数符号位相同，运算结果符号位相反，则发生溢出,OF置位
            end
            4'b0010 : result = b << a;//b左移a位
            4'b0011 : result = a | b;//a或b
            4'b0100 : result = a & b;//a与b相与
            4'b0101 : result = a < b;//无符号数a与无符号数b比较，a<b时输出1,否则输出0
            4'b0110 : result = (((a<b) && (a[31] == b[31] )) ||( ( a[31] == 1 && b[31] == 0)));//符号数a与符号数b比较，a<b时输出1,否则输出0
            4'b0111 : result = a ^ b;//a异或b
            4'b1000: result = ~(a | b);//a或非b
            4'b1001: result = b << 16;//b左移16位
            4'b1010: result = ((b >> a)|({32{b[31]}}<<(32-a)));//b算术右移a位,高位补符号位
            4'b1011: result = b >> a;//b逻辑右移a位,高位补0
            default: result = 0;//缺省运算为 输出0
        endcase
        end
endmodule
