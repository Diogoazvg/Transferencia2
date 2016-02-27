class Matricula < Autentication_sql_server
	self.table_name = "matriculas"
  self.primary_key = "cod_matricula"
  belongs_to :turma
  belongs_to :aluno, foreign_key: "cod_aluno"
  belongs_to :turno, foreign_key: "cod_turno"
  belongs_to :curso, foreign_key: "cod_curso"
  has_many :matricula_pauta, foreign_key: "cod_matricula"
  has_many :transferencia, foreign_key: "cod_matricula"


  	scope :ano_letivo_atual, ->(matricula){ Matricula.find_by_sql ["select matriculas.ano_let_atual 
           from matriculas, alunos
           where alunos.cod_aluno = matriculas.cod_aluno
            and  matriculas.matricula = ?", matricula] 		
	}
  	
  	scope :periodo_atual, ->(matricula) { Matricula.find_by_sql ["select matriculas.periodo_atual 
           from matriculas
           where matriculas.periodo_atual >= 2
           and matriculas.ano_let_atual = '2015'
           and matriculas.matricula = ?", matricula] 		
	}

	scope :codigo_do_curso, ->(matricula) { Matricula.find_by_sql ["select matriculas.cod_curso 
           from matriculas, alunos
           where alunos.cod_aluno = matriculas.cod_aluno
           and  matriculas.matricula = ?", matricula] 		
	}

	scope :codigo_do_turno, ->(matricula) { Matricula.find_by_sql ["select matriculas.cod_turno 
           from matriculas, alunos
           where alunos.cod_aluno = matriculas.cod_aluno
           and  matriculas.matricula = ?", matricula] 		
	}

  scope :codigo_do_turma_atual, ->(matricula) { Matricula.find_by_sql ["select matriculas.cod_turma_atual 
           from matriculas, alunos
           where alunos.cod_aluno = matriculas.cod_aluno
           and  matriculas.matricula = ?", matricula]     
  }

  scope :transferencia, ->(cod_turno, cod_turma, cod_aluno){Matricula.find_by_sql ["UPDATE MATRICULAS
          SET MATRICULAS.COD_TURNO = ?,COD_TURMA_ATUAL = ?
          from PESSOAS, TURMAS, ALUNOS, MATRICULAS, CURSOS
          WHERE MATRICULAS.COD_TURMA_ATUAL = turmas.COD_TURMA
          and MATRICULAS.COD_CURSO = CURSOS.COD_CURSO
          and PESSOAS.COD_PESSOA = ALUNOS.COD_PESSOA
          and ALUNOS.COD_ALUNO = MATRICULAS.COD_ALUNO
          and MATRICULAS.ANO_LET_ATUAL = '2015'
          and  ALUNOS.COD_ALUNO = ?",cod_turno, cod_turma, cod_aluno]
  }        
end



#and matriculas.ano_let_atual = DATEPART(YEAR, GETDATE())



