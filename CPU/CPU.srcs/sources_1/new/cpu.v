`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 09:31:21
// Design Name: 
// Module Name: cpu
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


module cpu(
    input clk,
    input reset,
    output wire [31:0] alu_a, 
    output wire [31:0] alu_b, 
    output wire [31:0] result, 
    output wire [31:0] mem_addr, mem_in, mem_dout, pc, mem_dout_dff
    );

    wire [31:0] neaddr;
    
    wire pcwre,wmem,iord,wir,regrt,call,regwre,extsel,dbdatasrc,shift,alusrca,zero,sign,OF,PF,CF;
    wire [1:0] pcsrc;
    wire [1:0] alusrcb;
    
    wire [31:0] inst;
    wire [31:0] db;
    wire [31:0] OF_dff;
    wire [4:0] rt_or_rd;
    wire [4:0] reg_addr;
    wire [31:0] reg_rs;
    wire [31:0] reg_rt;
    wire [31:0] reg_din;
    wire [31:0] reg_rs_dff;
    wire [31:0] reg_rt_dff;
    wire [31:0] tmp_alu_a;
    wire [3:0] aluop;
    wire [31:0] alu_dff;
    wire [31:0] ex_imm;    
    
    
    
    control_unit con(.func(inst[5:0]),.op(inst[31:26]),.zero(zero),.sign(sign),.OF(OF_dff[0]),.CF(CF),.PF(PF),.pcwre(pcwre),.alusrca(alusrca),.alusrcb(alusrcb),
    .dbdatasrc(dbdatasrc), .regwre(regwre),.call(call),.wmem(wmem),.regrt(regrt),.extsel(extsel),.pcsrc(pcsrc),.aluop(aluop),.iord(iord),
        .wir(wir),.shift(shift),.clk(clk),.clrn(reset));//实例化控制单元
        
    pc p(.clk(clk),.reset(reset),.next_addr(neaddr),.pc(pc),.pcwre(pcwre));//实例化指令计数器
    
    mem mem(.din(reg_rt_dff),.dout(mem_dout),.addr(mem_addr),.we(wmem),.clrn(reset),.clk(clk) );//实例化存储器
    assign mem_in = reg_rt_dff;
    
    regfile rfile( .address_rs(inst[25:21]),.address_rt(inst[20:16]),.write_reg_address(reg_addr),.write_data(reg_din),.data_rs(reg_rs),.data_rt(reg_rt),.we(regwre),.clrn(reset),.clk(clk));//实例化寄存器堆
    
    extend extend(.imm(inst[15:0]),.flag(extsel),.q(ex_imm));//实例化立即数扩展模块
    
    alu alu(.a(alu_a),.b(alu_b),.aluc(aluop),.result(result),.zero(zero),.sign(sign),.OF(OF),.CF(CF),.PF(PF) );//实例化alu
    
    dff32 ir(.e(wir),.d(mem_dout),.clk(clk),.clrn(reset),.q(inst)), dr(.e(1'b1),.d(mem_dout),.clk(clk),.clrn(reset),.q(mem_dout_dff));//指令寄存器
    dff32 dr_rs(.e(1'b1),.d(reg_rs),.clk(clk),.clrn(reset),.q(reg_rs_dff));//rs寄存器输出缓冲寄存器
    dff32 dr_rt(.e(1'b1),.d(reg_rt),.clk(clk),.clrn(reset),.q(reg_rt_dff));//rt/rd寄存器输出缓冲寄存器
    dff32 dr_alu(.e(1'b1),.d(result),.clk(clk),.clrn(reset),.q(alu_dff));//alu寄存器输出缓冲寄存器
    dff32 dr_OF(.e(1'b1),.d({31'b0,OF}),.clk(clk),.clrn(reset),.q(OF_dff));//alu寄存器OF标志位缓冲寄存器
    
    mux_2 mux_mem(.flag(iord),.a(pc),.b(alu_dff),.out(mem_addr));//根据控制信号iord选择存储器访问地址的来源
    mux_2 mux_db(.flag(dbdatasrc),.a(alu_dff),.b(mem_dout_dff),.out(db));//根据控制信号dbdatasrc选择数据总线的数据来源
    mux_2 mux_reg_din(.flag(call),.a(db),.b(pc),.out(reg_din));//根据控制信号call选择待写入寄存器堆的数据来源
    mux_2 mux_sa(.flag(shift),.a(reg_rs_dff),.b({{27{1'b0}},inst[10:6]}),.out(tmp_alu_a));//根据控制信号shift选择输出寄存器堆的输出或扩展后的sa
    mux_2 mux_alu_a(.flag(alusrca),.a(tmp_alu_a),.b(pc),.out(alu_a));//根据控制信号alusrca选择alu左操作数的来源
    mux_2_5 mux_rt_or_rd(.flag(regrt),.a(inst[20:16]),.b(inst[15:11]),.out(rt_or_rd));//根据控制信号regrt选择输出指令rt字段或rd字段
    mux_2_5 mux_reg_addr(.flag(call),.a(rt_or_rd),.b(5'h1F),.out(reg_addr));//根据控制信号call选择当前寄存器堆写入地址是指令对应寄存器或31号寄存器
    mux_4_32 mux_alu_b(.flag(alusrcb),.a(reg_rt_dff),.b(32'b100),.c(ex_imm),.d(ex_imm<<2),.out(alu_b));//根据控制信号alusrcab选择alu右操作数的来源
    mux_4_32 mux_pc(.flag(pcsrc),.a(result),.b(alu_dff),.c(reg_rs),.d({pc[31:28],inst[25:0],2'b00}),.out(neaddr));//根据控制信号alusrcab选择alu右操作数的来源
endmodule
