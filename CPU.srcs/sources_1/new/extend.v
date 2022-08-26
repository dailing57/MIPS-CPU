`timescale 1ns / 1ps

module extend(
    input [15:0] imm,//16位立即数
    input flag,//控制信号
    output [31:0] q//扩展后的32位立即数
    );
    assign q = {flag&&imm[15]?{16{1'b1}}:{16{1'b0}},imm};//只有flag为1，且立即数最高位为1，高位才补1，否则补0
endmodule
