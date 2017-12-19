# budgets_controller

require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("../models/transaction.rb")
require_relative("../models/budget.rb")
require_relative("../models/category.rb")
require_relative("../models/account.rb")

get "/budgets" do

  @transactions = Transaction.select_all()
  @categories = Category.select_all()
  @accounts = Account.select_all()
  erb(:"/budgets/index")
end


# budget_controller.rb
