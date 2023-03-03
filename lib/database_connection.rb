require 'pg'

class DatabaseConnection
  def self.connect(recipes_directory)
     @connection = PG.connect({ host: '127.0.0.1', dbname: recipes_directory })
  end

  def self.exec_params(query, params)
    @connection.exec_params(query, params)
  end
end