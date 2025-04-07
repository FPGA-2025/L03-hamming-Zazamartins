module calcula_hamming (
  input [10:0] entrada,
  output [14:0] saida
);

wire p1, p2, p4, p8; 

assign p1 = entrada[0] ^ entrada[1] ^ entrada[3] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10];
assign p2 = entrada[0] ^ entrada[2] ^ entrada[3] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10];
assign p4 = entrada[1] ^ entrada[2] ^ entrada[3] ^ entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10];
assign p8 = entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10];

assign saida = {entrada[10], entrada[9], entrada[8], entrada[7], entrada[6], entrada[5], entrada[4], p8, entrada[3], entrada[2], entrada[1], p4, entrada[0], p2, p1};

endmodule
