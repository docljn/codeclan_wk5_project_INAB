# vendors_controller.rb
require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

# require_relative("../models/account.rb")
# require_relative("../models/category.rb")
# require_relative("../models/transaction.rb")
require_relative("../models/vendor.rb")

get "/vendors" do
  @vendors = Vendor.select_all()
  erb(:"/vendors/index")
end








# vendors_controller.rb
