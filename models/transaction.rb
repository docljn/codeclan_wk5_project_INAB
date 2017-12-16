# transaction.rb
require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Transaction
  attr_reader :id
  attr_accessor :amount, :category_id, :vendor_id, :comment, :account_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @comment = options['comment']
    @category_id = options['category_id']
    @vendor_id = options['vendor_id']
    @account_id = options['account_id']
    # add date as an extension later: this will be tricky
  end

def save()
  sql = "INSERT INTO transactions
  (amount, category_id, vendor_id, comment, account_id)
  VALUES
  ($1, $2, $3, $4, $5)
  RETURNING id;"
  values = [@amount, @category_id, @vendor_id, @comment, @account_id]
  sql_result = SqlRunner.run(sql, values)
  @id = sql_result[0]['id']
end

def update()
  sql =
end


end
# transaction.rb
