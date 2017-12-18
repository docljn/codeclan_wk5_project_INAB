# accounts_controller.rb
require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("../models/account.rb")

get("/accounts") do
  @accounts = Account.select_all()
  erb(:"/accounts/index")
end


# accounts_controller.rb
