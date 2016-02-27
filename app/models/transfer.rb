class Transfer < Autentication_transf
	self.table_name = "searches"
	self.primary_key = "id"

	validates_presence_of :justificativa
end
