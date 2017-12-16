# category.rb
require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Category

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  # CRUD
  # create

  def insert()
    sql = "INSERT INTO categories (name) VALUES ($1) RETURNING id;"
    values = [@name]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end

end
# category.rb
