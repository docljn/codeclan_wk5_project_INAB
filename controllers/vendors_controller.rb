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
  @vendor = Vendor.select_one(params["id"])
  erb(:"/vendors/edit")
end

post "/vendors/:id" do
  vendor = Vendor.new(params)
  vendor.save()
  redirect to("/vendors")
end

# delete vendor - access from edit page?
post "/vendors/:id/delete" do
  Vendor.delete_one(params['id'])
  redirect to("/vendors")
end








# vendors_controller.rb
