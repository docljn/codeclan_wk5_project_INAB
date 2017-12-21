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
    sql = "SELECT * FROM transactions ORDER BY transaction_date;"
    sql_result = SqlRunner.run(sql)
    transactions_array = sql_result.map {|hash| Transaction.new(hash)}
  end

  def self.select_by_account(account_id)
    sql = "SELECT * FROM transactions WHERE account_id = $1 ORDER BY transaction_date;"
    values = [account_id]
    sql_result = SqlRunner.run(sql, values)
    transactions_array = sql_result.map {|hash| Transaction.new(hash)}
  end

  def self.select_by_category(category_id)
    sql = "SELECT * FROM transactions WHERE category_id = $1 ORDER BY transaction_date;"
    values = [category_id]
    sql_result = SqlRunner.run(sql, values)
    transactions_array = sql_result.map {|hash| Transaction.new(hash)}
  end

  def self.select_by_vendor(vendor_id)
    sql = "SELECT * FROM transactions WHERE vendor_id = $1 ORDER BY transaction_date;"
    values = [vendor_id]
    sql_result = SqlRunner.run(sql, values)
    transactions_array = sql_result.map {|hash| Transaction.new(hash)}
  end

  def self.select_by_date_range(date1, date2)
    sql = "SELECT * FROM transactions WHERE transaction_date BETWEEN $1 AND $2 ORDER BY transaction_date;"
    values = [date1, date2]
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
    sum = sql_result[0]['sum'].to_f
  end


  def self.sum_filtered(sql_result_array)
    sum = 0
    sql_result_array.each do |object|
      sum += object.amount
    end
    return sum
  end

  def self.sum_by_category(category_id)
    transactions = Transaction.select_by_category(category_id)
    sum = Transaction.sum_filtered(transactions)
    return sum
  end

  def self.sum_by_vendor(vendor_id)
    transactions = Transaction.select_by_vendor(vendor_id)
    sum = Transaction.sum_filtered(transactions)
    return sum
  end



  # read
  # CONSIDER REFACTORING VIEW TO USE CLASS METHODS FOR EACH OF THESE!
  def category()
    sql = "SELECT * FROM categories WHERE id = $1 ORDER BY name;"
    values = [@category_id]
    sql_result = SqlRunner.run(sql, values)
    return Category.new(sql_result[0])
  end

  def account()
    sql = "SELECT * FROM accounts WHERE id = $1 ORDER BY name;"
    values = [@account_id]
    sql_result = SqlRunner.run(sql, values)
    return Account.new(sql_result[0])
  end

  def vendor()
    sql = "SELECT * FROM vendors WHERE id = $1 ORDER BY name;"
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
    # this may not be necessary now that I have a default date in the date entry box
    if @transaction_date == nil or @transaction_date == ""
      @transaction_date = RecordDate.today
    end
    sql = "INSERT INTO transactions
    (amount, category_id, vendor_id, comment, account_id, transaction_date)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id;"
    values = [@amount, @category_id, @vendor_id, @comment, @account_id, @transaction_date]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end

  def update()
    sql = "UPDATE transactions SET (amount, category_id, vendor_id, comment, account_id, transaction_date) = ($1, $2, $3, $4, $5, $6) where id = $7;"
    values = [@amount, @category_id, @vendor_id, @comment, @account_id, @transaction_date, @id]
    sql_result = SqlRunner.run(sql, values)
  end


end
# transaction.rb
