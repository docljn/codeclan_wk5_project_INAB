# vendor.rb
require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Vendor

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # delete
  def self.delete_all()
    sql = "DELETE FROM vendors;"
    sql_result = SqlRunner.run(sql)
  end

  # delete
  def self.delete_one(id)
    sql = "DELETE FROM vendors WHERE id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
  end

  # read
  def self.select_all()
    sql = "SELECT * FROM vendors;"
    sql_result = SqlRunner.run(sql)
    categories_array = sql_result.map {|hash| Vendor.new(hash)}
  end

  # read
  def self.select_one(id)
    sql = "SELECT * FROM vendors where id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
    vendor = Vendor.new(sql_result[0])
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
    sql = "INSERT INTO vendors (name) VALUES ($1) RETURNING id;"
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
# vendor.rb
