class Pauta < Autentication_sql_server
	self.table_name = "pautas"
  	belongs_to :disciplina, foreign_key: "cod_disciplina"
  	has_many :matricula_pauta, foreign_key: "cod_pauta"
end