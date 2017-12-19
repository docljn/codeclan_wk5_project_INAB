# vendors_controller.rb
require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

# require_relative("../models/account.rb")
# require_relative("../models/category.rb")
require_relative("../models/transaction.rb")
require_relative("../models/vendor.rb")
require_relative("../models/display.rb")

get "/vendors" do
  @vendors = Vendor.select_all()
  @transactions = Transaction.select_all()
  erb(:"/vendors/index")
end

# create

get "/vendors/new" do
  erb(:"/vendors/new")
end

post "/vendors" do
  vendor = Vendor.new(params)
  vendor.save()
  redirect to("/vendors")
end

# edit

get "/vendors/:id/edit" do
  @vendor = Vendor.new(params['id'])
  erb(:"/vendors/edit")
end








# vendors_controller.rb
