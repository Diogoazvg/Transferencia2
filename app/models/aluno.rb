class Aluno < Autentication_sql_server
	self.table_name = "alunos"
  	self.primary_key = "COD_ALUNO"
  	has_many :matricula, foreign_key: "COD_ALUNO"
  	belongs_to :pessoa, foreign_key: "cod_pessoa"


    #beginscope :turno_atual, ->(n_pasta) {Aluno.select("pessoas.nome_pessoa,turnos.desc_turno,
     #turmas.desc_turma, turmas.cod_turma, matriculas.periodo_atual, matriculas.ano_let_atual, matriculas.periodo_let_atual")
    #.from("pessoas")
    #.where("Alunos.n_pasta = ?", n_pasta)
    #.joins(" INNER JOIN alunos ON alunos.cod_pessoa = pessoas.cod_pessoa INNER JOIN alunos ON alunos.cod_aluno = matriculas.cod_aluno INNER JOIN matriculas ON matriculas.cod_turno = turnos.cod_turno INNER JOIN turnos ON turnos.cod_turno = turmas.cod_turno")
    #}
    

	scope :turno_atual, ->(matricula) {Aluno.find_by_sql ["select pessoas.NOME_PESSOA, alunos.N_PASTA, turnos.DESC_TURNO, turmas.DESC_TURMA, alunos.COD_ALUNO, matriculas.PERIODO_ATUAL
		from pessoas, turmas, alunos, matriculas, turnos 
		where matriculas.cod_turma_ATUAL = turmas.cod_turma 
		and pessoas.cod_pessoa = alunos.cod_pessoa 
		and alunos.cod_aluno = matriculas.cod_aluno 
		and matriculas.cod_turno = turnos.cod_turno 
		and turnos.cod_turno = turmas.cod_turno
		and turmas.ano_let = '2015' 
		and matriculas.matricula = ?", matricula]
	}

	scope :turno_atual_salvar, ->(matricula) {Aluno.find_by_sql ["select pessoas.NOME_PESSOA, alunos.COD_ALUNO, alunos.N_PASTA, turnos.DESC_TURNO, matriculas.PERIODO_ATUAL
		from pessoas, turmas, alunos, matriculas, turnos 
		where matriculas.cod_turma_ATUAL = turmas.cod_turma 
		and pessoas.cod_pessoa = alunos.cod_pessoa 
		and alunos.cod_aluno = matriculas.cod_aluno 
		and matriculas.cod_turno = turnos.cod_turno 
		and turnos.cod_turno = turmas.cod_turno
		and turmas.ano_let = '2015' 
		and matriculas.matricula = ?", matricula]
	}   	
end




#and turmas.ano_let = DATEPART(YEAR, GETDATE())