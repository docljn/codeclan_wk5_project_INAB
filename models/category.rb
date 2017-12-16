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

  def self.delete_all()
    sql = "DELETE FROM categories;"
    sql_result = SqlRunner.run(sql)
  end

  def self.delete_one(id)
    sql = "DELETE FROM categories WHERE id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
  end




  # create & update

  def save()
    if @id
      update()
    else
      insert()
    end
  end



  private

  def insert()
    # create
    sql = "INSERT INTO categories (name) VALUES ($1) RETURNING id;"
    values = [@name]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end

  def update()
    # update
    sql = "UPDATE categories SET (name) = ($1) WHERE id = $2;"
    values = [@name, @id]
    sql_result = SqlRunner.run(sql, values)
  end

end
# category.rb
