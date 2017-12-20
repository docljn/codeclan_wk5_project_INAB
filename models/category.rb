# category.rb
require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Category

  attr_reader :id
  attr_accessor :name, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget'].to_f
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

  def set_budget()
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
    sql = "INSERT INTO categories (name, budget) VALUES ($1, $2) RETURNING id;"
    values = [@name, @budget]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end

  def update()
    # update
    sql = "UPDATE categories SET (name, budget) = ($1, $2) WHERE id = $3;"
    values = [@name, @budget, @id]
    sql_result = SqlRunner.run(sql, values)
  end

end
# category.rb
