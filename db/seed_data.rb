require('pry-byebug')

require_relative('../models/category.rb')
require_relative('../models/vendor.rb')
require_relative('../models/transaction.rb')



# categories
housekeeping = Category.new({'name' => 'housekeeping'})
gifts = Category.new({'name' => 'gifts'})
car = Category.new({'name' => 'car'})
entertainment = Category.new({'name' => 'entertainment'})

housekeeping.save()
gifts.save()
car.save()
entertainment.save()


# vendors


# transactions



# accounts: # extension

binding.pry
nil
