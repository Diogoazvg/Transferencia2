class Transfer < Autentication_transf
	self.table_name = "searches"
	self.primary_key = "id"
	mount_uploader :my_file, FileUploader

	#validates_presence_of :justificativa
end
