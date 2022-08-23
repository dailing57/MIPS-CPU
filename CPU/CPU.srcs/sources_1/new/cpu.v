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
        .wir(wir),.shift(shift),.clk(clk),.clrn(reset));//ʵ�������Ƶ�Ԫ
        
    pc p(.clk(clk),.reset(reset),.next_addr(neaddr),.pc(pc),.pcwre(pcwre));//ʵ����ָ�������
    
    mem mem(.din(reg_rt_dff),.dout(mem_dout),.addr(mem_addr),.we(wmem),.clrn(reset),.clk(clk) );//ʵ�����洢��
    assign mem_in = reg_rt_dff;
    
    regfile rfile( .address_rs(inst[25:21]),.address_rt(inst[20:16]),.write_reg_address(reg_addr),.write_data(reg_din),.data_rs(reg_rs),.data_rt(reg_rt),.we(regwre),.clrn(reset),.clk(clk));//ʵ�����Ĵ�����
    
    extend extend(.imm(inst[15:0]),.flag(extsel),.q(ex_imm));//ʵ������������չģ��
    
    alu alu(.a(alu_a),.b(alu_b),.aluc(aluop),.result(result),.zero(zero),.sign(sign),.OF(OF),.CF(CF),.PF(PF) );//ʵ����alu
    
    dff32 ir(.e(wir),.d(mem_dout),.clk(clk),.clrn(reset),.q(inst)), dr(.e(1'b1),.d(mem_dout),.clk(clk),.clrn(reset),.q(mem_dout_dff));//ָ��Ĵ���
    dff32 dr_rs(.e(1'b1),.d(reg_rs),.clk(clk),.clrn(reset),.q(reg_rs_dff));//rs�Ĵ����������Ĵ���
    dff32 dr_rt(.e(1'b1),.d(reg_rt),.clk(clk),.clrn(reset),.q(reg_rt_dff));//rt/rd�Ĵ����������Ĵ���
    dff32 dr_alu(.e(1'b1),.d(result),.clk(clk),.clrn(reset),.q(alu_dff));//alu�Ĵ����������Ĵ���
    dff32 dr_OF(.e(1'b1),.d({31'b0,OF}),.clk(clk),.clrn(reset),.q(OF_dff));//alu�Ĵ���OF��־λ����Ĵ���
    
    mux_2 mux_mem(.flag(iord),.a(pc),.b(alu_dff),.out(mem_addr));//���ݿ����ź�iordѡ��洢�����ʵ�ַ����Դ
    mux_2 mux_db(.flag(dbdatasrc),.a(alu_dff),.b(mem_dout_dff),.out(db));//���ݿ����ź�dbdatasrcѡ���������ߵ�������Դ
    mux_2 mux_reg_din(.flag(call),.a(db),.b(pc),.out(reg_din));//���ݿ����ź�callѡ���д��Ĵ����ѵ�������Դ
    mux_2 mux_sa(.flag(shift),.a(reg_rs_dff),.b({{27{1'b0}},inst[10:6]}),.out(tmp_alu_a));//���ݿ����ź�shiftѡ������Ĵ����ѵ��������չ���sa
    mux_2 mux_alu_a(.flag(alusrca),.a(tmp_alu_a),.b(pc),.out(alu_a));//���ݿ����ź�alusrcaѡ��alu�����������Դ
    mux_2_5 mux_rt_or_rd(.flag(regrt),.a(inst[20:16]),.b(inst[15:11]),.out(rt_or_rd));//���ݿ����ź�regrtѡ�����ָ��rt�ֶλ�rd�ֶ�
    mux_2_5 mux_reg_addr(.flag(call),.a(rt_or_rd),.b(5'h1F),.out(reg_addr));//���ݿ����ź�callѡ��ǰ�Ĵ�����д���ַ��ָ���Ӧ�Ĵ�����31�żĴ���
    mux_4_32 mux_alu_b(.flag(alusrcb),.a(reg_rt_dff),.b(32'b100),.c(ex_imm),.d(ex_imm<<2),.out(alu_b));//���ݿ����ź�alusrcabѡ��alu�Ҳ���������Դ
    mux_4_32 mux_pc(.flag(pcsrc),.a(result),.b(alu_dff),.c(reg_rs),.d({pc[31:28],inst[25:0],2'b00}),.out(neaddr));//���ݿ����ź�alusrcabѡ��alu�Ҳ���������Դ
endmodule
