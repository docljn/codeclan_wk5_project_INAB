require('pry-byebug')

require_relative('../models/category.rb')
require_relative('../models/vendor.rb')
require_relative('../models/transaction.rb')



# categories
Category.delete_all()

housekeeping = Category.new({'name' => 'housekeeping'})
gifts = Category.new({'name' => 'gifts'})
car = Category.new({'name' => 'car'})
fun = Category.new({'name' => 'fun'})

housekeeping.save()
gifts.save()
car.save()
fun.save()






# vendors


# transactions



# accounts: # extension

binding.pry
nil
