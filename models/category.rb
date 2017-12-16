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

  # delete
  def self.delete_all()
    sql = "DELETE FROM categories;"
    sql_result = SqlRunner.run(sql)
  end

  # delete
  def self.delete_one(id)
    sql = "DELETE FROM categories WHERE id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
  end

  # read
  def self.select_all()
    sql = "SELECT * FROM categories;"
    sql_result = SqlRunner.run(sql)
    categories_array = sql_result.map {|hash| Category.new(hash)}
  end

  # read
  def self.select_one(id)
    sql = "SELECT * FROM categories where id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
    category = Category.new(sql_result[0])
  end

  # create & update
  def save()
    if @id
      update()
    else
      insert()
    end
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE category_id = $1;"
    values = [@id]
    sql_result = SqlRunner.run(sql, values)
    transactions = sql_result.map {|hash| Transaction.new(hash)}
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
