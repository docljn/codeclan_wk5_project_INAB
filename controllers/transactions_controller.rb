# transactions_controller
require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("../models/account.rb")
require_relative("../models/category.rb")
require_relative("../models/transaction.rb")
require_relative("../models/vendor.rb")
require_relative("../models/display.rb")



get "/transactions" do
  # working
  # add logic here to deal with the filtered transactions
  @vendors = Vendor.select_all()
  @categories = Category.select_all()
  @accounts = Account.select_all()
  if params["category_id"]
    @transactions = Transaction.select_by_category(params["category_id"])
  elsif params["vendor_id"]
    @transactions = Transaction.select_by_vendor(params["vendor_id"])
  elsif params["account_id"]
    @transactions = Transaction.select_by_account(params["account_id"])
  elsif params["filter_by_date"]
    @transactions = Transaction.select_by_date_range(params["date1"], params["date2"])
  else
    @transactions = Transaction.select_all()
  end
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


# edit tx - two parter?
get "/transactions/:id/edit" do
  # view to allow change to existing tx
  @transaction = Transaction.select_one(params['id'])
  @vendors = Vendor.select_all()
  @categories = Category.select_all()
  @accounts = Account.select_all()
  erb(:"transactions/edit")

end

post "/transactions/:id" do
  transaction = Transaction.new(params)
  transaction.save()
  erb(:"/transactions/show")
  # i.e. go to show details
end


# delete tx - access from edit page?
post "/transactions/:id/delete" do
  Transaction.delete_one(params['id'])
  redirect to("/transactions")
end



# transactions_controller
