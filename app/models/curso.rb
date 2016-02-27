class Curso < Autentication_sql_server
	self.table_name = "cursos"
  	self.primary_key = "cod_curso"
  	has_many :matricula, foreign_key: "cod_curso"
  	has_many :turma, foreign_key: "cod_turma"
  	has_many :transferencia, foreign_key: "cod_turma"
  	belongs_to :turno, foreign_key: "cod_turno"
end
