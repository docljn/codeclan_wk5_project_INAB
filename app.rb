# app.rb
require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./controllers/accounts_controller.rb')
require_relative('./controllers/categories_controller.rb')
require_relative('./controllers/transactions_controller.rb')
require_relative('./controllers/vendors_controller.rb')

# this will be the home page for the whole app
# thus 'index'
# not sure whether to keep this or just go straight to
# recent transactions page instead.

get '/' do
  erb(:index)
end






# app.rb
