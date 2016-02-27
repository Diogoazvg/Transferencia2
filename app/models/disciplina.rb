class Disciplina < Autentication_sql_server
	self.table_name = "disciplinas"
  	has_many :pauta, foreign_key: "cod_disciplina"
  	has_many :matricula_pauta, foreign_key: "cod_disciplina"
  	has_many :disciplina_transferencia, foreign_key: "cod_disciplina"	
end
