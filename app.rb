# app.rb
require('sinatra')
require('sinatra/contrib/all') if development?

# CARE: if you add a new controller, you MUST add it below!

require_relative('./controllers/accounts_controller.rb')
require_relative('./controllers/categories_controller.rb')
require_relative('./controllers/transactions_controller.rb')
require_relative('./controllers/vendors_controller.rb')

# this will be the home page for the whole app
# thus 'index'
# not sure whether to keep this blank or just go straight to
# 10 most recent transactions instead.

p "This is process #{Process.pid}"

get '/' do
  @transactions = Transaction.select_all()
  @categories = Category.select_all()
  @accounts = Account.select_all()
  # erb(:index)
  redirect to("/transactions")
end






# app.rb
