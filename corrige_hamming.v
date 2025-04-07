module corrige_hamming (
  input [14:0] entrada, // a paridade é o bit mais significativo (dado[8])
  output reg [10:0] saida
);

// Total de 4 bits para Erro
wire[3:0] erro; 

// Bits de Paridade
wire p1_novo, p2_novo, p4_novo, p8_novo; 

// Registrador para armazenar correção
reg [14:0] entrada_corrigida; 

// Posição em que está o erro
integer erro_posicao;

assign p1_novo = entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
assign p2_novo = entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
assign p4_novo = entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
assign p8_novo = entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

assign erro = {p8_novo ^ entrada[7], p4_novo ^ entrada[3], p2_novo ^ entrada[1], p1_novo ^ entrada[0]}; // Determinando se há erro e sua posição

always @(*) begin
  entrada_corrigida = entrada;
  erro_posicao = erro;

  if(erro_posicao != 0) 
  
  begin 
    entrada_corrigida[erro_posicao - 1] = ~entrada_corrigida[erro_posicao - 1];
  end

  // Nova saida
  saida = {entrada_corrigida[14], entrada_corrigida[13], entrada_corrigida[12], entrada_corrigida[11], entrada_corrigida[10], entrada_corrigida[9], entrada_corrigida[8], entrada_corrigida[6], entrada_corrigida[5], entrada_corrigida[4], entrada_corrigida[2]};

end

endmodule