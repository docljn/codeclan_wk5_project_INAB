# accounts_controller.rb
require("sinatra")
require('sinatra/contrib/all') if development?
require_relative("../models/account.rb")


# read
get "/accounts" do
  @accounts = Account.select_all()
  erb(:"/accounts/index")
end

# create
get "/accounts/new"  do
  erb(:"/accounts/new")
end

post "/accounts" do
  account = Account.new(params)
  account.save()
  redirect to("/accounts")
end

# edit

get "/accounts/:id/edit" do
  @account = Account.select_one(params["id"])
  @transactions_count = @account.transactions().length
  erb(:"/accounts/edit")
end

post "/accounts/:id" do
  account = Account.new(params)
  account.save()
  redirect to("/accounts")
end

# delete

post "/accounts/:id/delete" do
  Account.delete_one(params["id"])
  redirect to("/accounts")
end


# accounts_controller.rb
