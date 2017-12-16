# vendor.rb
require('pry-byebug')

class Vendor

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
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
