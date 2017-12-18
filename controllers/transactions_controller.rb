# transactions_controller
require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("../models/account.rb")
require_relative("../models/category.rb")
require_relative("../models/transaction.rb")
require_relative("../models/vendor.rb")



get "/transactions" do
  # working
  @transactions = Transaction.select_all()
  erb(:"/transactions/index")
end


# two-part create new tx
get "/transactions/new" do
  # new tx view
  # @transactions = Transaction.select_all()
  @vendors = Vendor.select_all()
  @categories = Category.select_all()
  @accounts = Account.select_all()
  erb(:"/transactions/new")
end

post "/transactions" do
  # new tx insert
  tx = Transaction.new(params)
  tx.save
  redirect to("/transactions")
end


# # edit tx - two parter?
# get "/transactions/:id/edit" do
#   # view to allow change to existing tx
#   erb(:"transactions/edit")
#
# end
#
# post "/transactions/:id" do
#   # save changes to edited tx
#   erb(:"/transactions/show")
#   # i.e. go to show details
# end



# transactions_controller
