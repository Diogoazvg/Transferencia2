class MatriculaPauta < Autentication_sql_server
	self.table_name = "matriculas_pautas"
  	belongs_to :pauta, foreign_key: "cod_pauta"
  	belongs_to :disciplina, foreign_key: "cod_disciplina"
  	has_many :matricula_pauta_transferencia, foreign_key: "cod_matricula"
  	has_many :matricula_pauta_transferencia, foreign_key: "cod_pauta"
end
