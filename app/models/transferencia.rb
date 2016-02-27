class Transferencia < Autentication_sql_server
	self.table_name = "transferencias"
  	#self.primary_key = "cod_matricula"
    belongs_to :matricula, foreign_key: "cod_matricula"
    belongs_to :curso, foreign_key: "cod_curso"
    has_many :matricula_pauta_transferencia, foreign_key: "cod_transferencia"
    has_many :disciplina_transferencia, foreign_key: "cod_transferencia"
end
