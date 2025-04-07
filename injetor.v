module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);

always @(*) begin
  saida = entrada;
  if(erro && (n<15)) 
  
  begin
  
    // Inverte o bit na posição n
    saida[n] = ~saida[n]; 
  end
end

endmodule