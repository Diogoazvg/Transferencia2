class Turma < Autentication_sql_server
	self.table_name = "turmas"
  	self.primary_key = "COD_TURMA"
  	belongs_to :turno, foreign_key: "cod_turno"
  	belongs_to :curso, foreign_key: "cod_curso"
  	has_many :pauta, foreign_key: "COD_TURMA"

  	scope :turma_disponivel, ->(periodo_atual, codigo_do_curso, codigo_do_turno) {Turma.find_by_sql ["select turmas.desc_turma,turnos.desc_turno, 
		turmas.cod_turma, cursos.desc_curso
		from turmas, turnos, cursos
		where  turnos.cod_turno = turmas.cod_turno
		and cursos.cod_curso = turmas.cod_curso
		and turmas.ano_let = '2015'
		and turmas.periodo = ? and turmas.cod_curso =? and turmas.cod_turno != ?", periodo_atual, codigo_do_curso, codigo_do_turno]
	}

	scope :turma_disponivel_salvar, ->(periodo_atual, codigo_do_curso, codigo_do_turno) {Turma.find_by_sql ["select turmas.DESC_TURMA,turnos.desc_turno,turnos.COD_TURNO, 
		turmas.COD_TURMA
		from turmas, turnos, cursos
		where  turnos.cod_turno = turmas.cod_turno
		and cursos.cod_curso = turmas.cod_curso
		and turmas.ano_let = '2015'
		and turmas.periodo = ? and turmas.cod_curso =? and turmas.cod_turno != ?", periodo_atual, codigo_do_curso, codigo_do_turno]
	}

	scope :alunos_por_turma, ->(codigo_turma) {Turma.find_by_sql ["select (PESSOAS.NOME_PESSOA) 
    	from matriculas, pessoas, alunos, turmas, cursos
		where matriculas.COD_TURMA_ATUAL = turmas.COD_TURMA
		and ALUNOS.COD_PESSOA = PESSOAS.COD_PESSOA
		and MATRICULAS.COD_ALUNO = ALUNOS.COD_ALUNO
		and MATRICULAS.COD_CURSO = CURSOS.COD_CURSO
		and TURMAS.COD_CURSO = CURSOS.COD_CURSO
		and TURMAS.COD_TURMA = ?", codigo_turma]
	}
end
