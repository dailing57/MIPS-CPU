`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 09:06:51
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [5:0]func,//ָ��func�ֶ�
    input [5:0]op,//ָ��op�ֶ�
    input zero,//alu��־λ
    input sign,//alu��־λ
    input OF,//alu��־λ
    input CF,//alu��־λ
    input PF,//alu��־λ
    input clk,//ʱ���ź�
    input clrn,//��λ�ź�
    output reg pcwre,//�����ź�
    output iord,//�����ź�
    output wmem,//�����ź�
    output wir,//�����ź�
    output dbdatasrc,//�����ź�
    output regrt,//�����ź�
    output call,//�����ź�
    output reg extsel,//�����ź�
    output reg regwre,//�����ź�
    output reg alusrca,//�����ź�
    output shift,//�����ź�
    output reg [1:0] alusrcb,//�����ź�
    output reg [1:0] pcsrc,//�����ź�
    output reg [3:0] aluop//�����ź�
    );
    wire add,sub,addiu,addu,subu,addi,andi,and_,ori,or_,xori,xor_,nor_,lui,sll,srl,sra,sllv,srlv,srav,slti,slt,sltu,sltiu,sw,lw,beq,bne,bltz,j,jr,jal,halt;
    wire R;
    
    assign R = !(op[3]||op[2]||op[1]||op[0]);//�ڵ�ǰָ�,RΪ1���ҽ���ָ���ʽΪR��ָ��
    reg [2:0] state;//��ǰ���Ƶ�Ԫ״̬
    //����ָ�ֵ,ָ������Ӧ����Ϊ1���ҽ�����ǰָ��Ϊ��Ӧָ��    
    assign add = R&&(func==6'b100000);
    assign sub = R&&(func==6'b100010);
    assign addiu = op==6'b001001;//���������ԣ���������ļ�
    assign addu = R&&(func==6'b100001);
    assign subu = R&&(func==6'b100011);
    assign addi = op==6'b001000;
    assign andi = op==6'b001100;
    assign and_ = R&&(func==6'b100100);
    assign ori = op==6'b001101;
    assign or_ = R&&(func==6'b100101);
    assign xori = op==6'b001110;
    assign xor_ = R&&(func==6'b100110);
    assign nor_ = R&&(func==6'b100111);
    assign lui = op==6'b001111;
    assign sll = R&&(func==6'b000000);
    assign srl = R&&(func==6'b000010);
    assign sra = R&&(func==6'b000011);
    assign sllv = R&&(func==6'b000100);
    assign srlv = R&&(func==6'b000110);
    assign srav = R&&(func==6'b000111);
    assign slti = op==6'b001010;
    assign slt = R&&(func==6'b101010);
    assign sltu = R&&(func==6'b101011);
    assign sltiu = op==6'b001011;
    assign sw = op==6'b101011;
    assign lw = op==6'b100011;
    assign beq = op==6'b000100;
    assign bne = op==6'b000101;
    assign bltz = op==6'b000001;
    assign j = op==6'b000010;
    assign jr = R&&(func==6'b001000);
    assign jal = op==6'b000011;
    assign halt = op==6'b111111;
    //���߼����ʽ�򵥵Ŀ����źŲ���ֱ��assign��ֵ
    assign shift = (srl|sll|sra)&(state == 3'b110);
    assign dbdatasrc = state == 3'b100; 
    assign call = jal&(state == 3'b001);
    assign iord = (state == 3'b10)|(state == 3'b11);
    assign wmem = sw&(state == 3'b011);
    assign wir = state == 3'b0;
    assign regrt = R&(state == 3'b111);
    
    initial
    begin
        state = 3'b000;//���Ƶ�Ԫ��ʼ״̬Ϊ1
    end
    
    
    always @(negedge clk,negedge clrn)//ʱ���߼���ʱ���½��ص���ʱ�����ݵ�ǰ״̬��ָ����ת����Ӧ�¸�״̬
    begin
        if(!clrn) begin
            state <= 3'b0;
        end
        else begin
            case(state)
                3'b000: state<=3'b001;
                3'b001:
                if(sw||lw) state<=3'b010;
                else if(beq||bne||bltz) state<=3'b101;
                else if(j||jal||jr||halt) state<=3'b000;
                else state<=3'b110;
                3'b010: state<=3'b011;
                3'b011: state<= (lw?3'b100:3'b000);
                3'b100: state<=3'b000;
                3'b101: state<=3'b000;
                3'b110: state<=3'b111;
                3'b111: state<=3'b000;
            endcase
        end
    
    end
    
    always @(state,zero,sign,OF)//����߼�,���ݵ�ǰCPU״̬��ALU��־λ��ָ��func��op�����ʣ������ź�
    begin
        pcwre=1'b0;
        alusrca=1'b0;
        alusrcb=2'b0;
        regwre=1'b0;
        extsel=1'b0;
        pcsrc=2'b0;
        aluop=4'b0;
        case(state)
            3'b000: begin
                pcwre=1'b1;
                alusrca=1'b1;
                alusrcb[0]=1'b1;
            end
            3'b001:begin
                aluop[0] = halt;
                pcsrc[0] = j||jal;
                pcsrc[1] = pcsrc[0]||jr;
                pcwre = pcsrc[1]||halt;
                alusrca = !pcsrc[1];
                alusrcb = {!pcwre,alusrca};
                extsel = alusrcb[1];
                regwre = jal;
            end
            3'b010: {alusrcb[1],extsel} = 2'b11;
            3'b100: regwre=!(OF&&(addiu||add||sub));
            3'b101: begin
                pcsrc[0]=1'b1;
                aluop[0]=!bltz;
                pcwre=(beq&&zero)||(bne&&!zero)||(bltz&&sign);
            end
            3'b110: begin
                alusrcb[1] = !R;
                extsel = addiu||slti;
                aluop[3] = nor_||srl||sra||srlv||srav||lui;
                aluop[2] = and_||xor_||sltu||slt||andi||xori||slti||sltiu;
                aluop[1] = or_||xor_||sll||srl||sra||sllv||srlv||srav||slt||ori||xori||slti;
                aluop[0] = sub||subu||or_||xor_||srl||srlv||sltu||ori||xori||lui||sltiu;
            end
            3'b111: regwre=1;
        endcase
    end
endmodule
