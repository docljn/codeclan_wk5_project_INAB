# account.rb
require('pry-byebug')

class Account

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options[id]
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO accounts (name) VALUES ($1) RETURNING id;"
    values = [@name]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end



end




# account.rb
