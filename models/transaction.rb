# transaction.rb
require('pry-byebug')

class Transaction
  attr_reader :id
  attr_accessor :amount, :category_id, :vendor_id, :comment


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @comment = options['comment']
    @category_id = options['category_id']
    @vendor_id = options['vendor_id']
    # add date as an extension later: this will be tricky
  end
end



# transaction.rb
