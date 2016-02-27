class Turno < Autentication_sql_server
	self.table_name = "turnos"
  	self.primary_key = "cod_turno"
  	has_many :matricula, foreign_key: "cod_turno"
  	has_many :turma, foreign_key: "cod_turno"
  	has_many :curso, foreign_key: "cod_turno"
  	
end
