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
    if @id
      update()
    else
      insert()
    end
  end


  private
  def insert()
    sql = "INSERT INTO accounts (name) VALUES ($1) RETURNING id;"
    values = [@name]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end

  def update()
    sql = "UPDATE accounts SET (name) = ($1) WHERE (id) = ($2);"
    values = [@name, @id]
    sql_result = SqlRunner.run(sql, values)
  end




end




# account.rb
