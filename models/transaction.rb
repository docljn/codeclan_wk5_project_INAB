# transaction.rb
require('pry-byebug')
# require('bigdecimal') - recommended for precise calculations, but 12 times slower than float.  Using float for now as database provides precision?
require_relative('../db/sql_runner.rb')
require_relative('../models/record_date.rb')

class Transaction
  attr_reader :id, :transaction_date
  attr_accessor :amount, :category_id, :vendor_id, :comment, :account_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_f
    @comment = options['comment']
    @category_id = options['category_id'].to_i
    @vendor_id = options['vendor_id'].to_i
    @account_id = options['account_id'].to_i
    # add date as an extension later: this will be tricky
    @transaction_date = options['transaction_date'] if options['transaction_date']
  end

  # delete
  def self.delete_all()
    sql = "DELETE FROM transactions;"
    sql_result = SqlRunner.run(sql)
  end

  # delete
  def self.delete_one(id)
    sql = "DELETE FROM transactions WHERE id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
  end

  # read
  def self.select_all()
    sql = "SELECT * FROM transactions;"
    sql_result = SqlRunner.run(sql)
    transactions_array = sql_result.map {|hash| Transaction.new(hash)}
  end

  def self.select_by_account(account_id)
    sql = "SELECT * FROM transactions WHERE account_id = $1;"
    values = [account_id]
    sql_result = SqlRunner.run(sql, values)
    transactions_array = sql_result.map {|hash| Transaction.new(hash)}
  end

  def self.select_by_category(category_id)
    sql = "SELECT * FROM transactions WHERE category_id = $1;"
    values = [category_id]
    sql_result = SqlRunner.run(sql, values)
    transactions_array = sql_result.map {|hash| Transaction.new(hash)}
  end

  def self.select_by_vendor(vendor_id)
    sql = "SELECT * FROM transactions WHERE vendor_id = $1;"
    values = [vendor_id]
    sql_result = SqlRunner.run(sql, values)
    transactions_array = sql_result.map {|hash| Transaction.new(hash)}
  end

  # read
  def self.select_one(id)
    sql = "SELECT * FROM transactions where id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
    transaction = Transaction.new(sql_result[0])
  end

  # read
  def self.sum_all()
    sql = "SELECT SUM(amount) FROM transactions;"
    sql_result = SqlRunner.run(sql)
    total = sql_result[0]['sum']
  end


  def self.sum_filtered(sql_result_array)
    sum = 0
    sql_result_array.each do |object|
      sum += object.amount
    end
    return sum
  end


  # def self.total_sql(column, property)
  #   sql = "SELECT SUM(amount) FROM transactions WHERE $1 = $2;"
  #   values = [column, property]
  #   sql_result = SqlRunner.run(sql, values)
  #   binding.pry
  #   nil
  #   return sql_result[0]['sum']
  # end

  # from psql docs:
  # \set foo 'my_table'
  # testdb=> SELECT * FROM :"foo";


  # read
  # CONSIDER REFACTORING VIEW TO USE CLASS METHODS FOR EACH OF THESE!
  def category()
    sql = "SELECT * FROM categories WHERE id = $1;"
    values = [@category_id]
    sql_result = SqlRunner.run(sql, values)
    return Category.new(sql_result[0])
  end

  def account()
    sql = "SELECT * FROM accounts WHERE id = $1;"
    values = [@account_id]
    sql_result = SqlRunner.run(sql, values)
    return Account.new(sql_result[0])
  end

  def vendor()
    sql = "SELECT * FROM vendors WHERE id = $1;"
    values = [@vendor_id]
    sql_result = SqlRunner.run(sql, values)
    return Vendor.new(sql_result[0])
  end


  # create
  def save()
    if @id
      update()
    else
      insert()
    end
  end


  private
  def insert()
    sql = "INSERT INTO transactions
    (amount, category_id, vendor_id, comment, account_id, transaction_date)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id;"
    values = [@amount, @category_id, @vendor_id, @comment, @account_id, RecordDate.today]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end

  def update()
    sql = "UPDATE transactions SET (amount, category_id, vendor_id, comment, account_id) = ($1, $2, $3, $4, $5) where id = $6;"
    values = [@amount, @category_id, @vendor_id, @comment, @account_id, @id]
    sql_result = SqlRunner.run(sql, values)
  end


end
# transaction.rb
