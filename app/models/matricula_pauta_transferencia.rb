class MatriculaPautaTransferencia < Autentication_sql_server
	self.table_name = "matriculas_pautas_transferencias"
  	belongs_to :transferencia, foreign_key: "cod_transferencia"
  	belongs_to :matricula_pauta, foreign_key: "cod_pauta"
  	belongs_to :matricula_pauta, foreign_key: "cod_matricula"
end
