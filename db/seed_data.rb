require('pry-byebug')

require_relative('../models/category.rb')
require_relative('../models/vendor.rb')
require_relative('../models/transaction.rb')



# categories
Category.delete_all()
Vendor.delete_all()

housekeeping = Category.new({'name' => 'housekeeping'})
gifts = Category.new({'name' => 'gifts'})
car = Category.new({'name' => 'car'})
fun = Category.new({'name' => 'fun'})

housekeeping.save()
gifts.save()
car.save()
fun.save()


lidl = Vendor.new({'name' => 'Lidl'})
aldi = Vendor.new({'name' => 'Aldi'})
sainsburys = Vendor.new({'name' => 'Sainsburys'})
waitrose = Vendor.new({'name' => 'Waitrose'})

lidl.save()
aldi.save()
sainsburys.save()
waitrose.save()




# vendors


# transactions



# accounts: # extension

binding.pry
nil
