class Pessoa < Autentication_sql_server
	self.table_name = "pessoas"
  	self.primary_key = "cod_pessoa"
  	has_many :aluno, foreign_key: "cod_pessoa"

  	scope :encontrar_pessoa, -> (n_pasta) {Pessoa
  		.joins(:aluno)
  		.where("Alunos.N_PASTA = ?", n_pasta)
  	}

end