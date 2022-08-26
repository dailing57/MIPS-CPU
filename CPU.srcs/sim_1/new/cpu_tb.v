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
    // �����ź�
    reg clock; 
    reg mem_clk;
    reg resetn; 
    // ����ź�,���ڹ۲����н���Ƿ���ȷ
    wire [2:0] state;
    wire [31:0] pc, ir, alua, alub, aluout; 
    wire [31:0] mem_adr, mem_d_in, mem_d_out;
    wire [4:0] add_rs, add_rt;
    wire [31:0]  reg_din, reg_rs, reg_rt; 
    // Ԫ������
    cpu cpu_system(clock, mem_clk, resetn, state, alua, alub, aluout, mem_adr, 
    mem_d_in, mem_d_out, pc, ir, add_rs, add_rt, reg_din, reg_rs, reg_rt); 
    
    //ϵͳʱ���ź�
    always begin 
        clock = 1; 
        #2; 
        clock = 0; 
        #2; 
    end   
     //�洢����ʱ���ź�
     always begin 
         mem_clk = 0; 
         #1; 
         mem_clk = 1; 
         #1; 
     end
    //��λ�ź�ʱ��
    initial begin 
        resetn = 0; 
        #1; 
        resetn = 1; 
    end
endmodule
