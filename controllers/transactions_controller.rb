# transactions_controller
require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/account.rb')
require_relative('../models/category.rb')
require_relative('../models/transaction.rb')
require_relative('../models/vendor.rb')



get '/transactions' do
  @transactions = Transaction.select_all()

  erb(:"/transactions/index")
end



# transactions_controller
