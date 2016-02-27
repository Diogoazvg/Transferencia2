class Biblioteca < Autentication_biblioteca
	self.table_name = "nada_consta"
  	self.primary_key = "id"

  	scope :bb, ->(var){ Biblioteca.where(var) 		
	}
end
