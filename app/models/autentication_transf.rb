class Autentication_transf < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "development_postgres_transferencia"
end