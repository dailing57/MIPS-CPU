`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 10:05:45
// Design Name: 
// Module Name: cpu_tb
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


module cpu_tb(

    );
    // 激励信号
    reg clock; 
    reg resetn; 
    // 输出信号,用于观察运行结果是否正确
    wire [31:0] alua; 
    wire [31:0] alub; 
    wire [31:0] aluout; 
    wire [31:0] mem_adr, mem_d_in, mem_d_out, pc, ir; 
    // 元件例化
    cpu cpu_system(clock, resetn, alua, alub, aluout, mem_adr, 
    mem_d_in, mem_d_out, pc, ir); 
    
    //系统时钟信号
    always begin 
    clock = 1; 
    #2; 
    clock = 0; 
    #2; 
    end 
    
    //复位信号时钟
    initial begin 
    resetn = 0; 
    #1; 
    resetn = 1; 
    end
    endmodule
