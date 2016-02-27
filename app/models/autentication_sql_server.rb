class Autentication_sql_server < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "development_Sql"
  #establish_connection "development_postgres"
end