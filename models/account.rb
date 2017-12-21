# account.rb
require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Account

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # delete
  def self.delete_all()
    sql = "DELETE FROM accounts;"
    sql_result = SqlRunner.run(sql)
  end

  # delete
  def self.delete_one(id)
    sql = "DELETE FROM accounts WHERE id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
  end

  # read
  def self.select_all()
    sql = "SELECT * FROM accounts;"
    sql_result = SqlRunner.run(sql)
    accounts_array = sql_result.map {|hash| Account.new(hash)}
  end

  # read
  def self.select_one(id)
    sql = "SELECT * FROM accounts where id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
    account = Account.new(sql_result[0])
  end

  def save()
      if @id
        update()
      else
        insert()
      end
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE account_id = $1;"
    values = [@id]
    sql_result = SqlRunner.run(sql, values)
    transactions = sql_result.map {|hash| Transaction.new(hash)}
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
