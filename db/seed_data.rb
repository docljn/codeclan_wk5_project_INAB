require('pry-byebug')

require_relative('../models/category.rb')
require_relative('../models/vendor.rb')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')


# Transaction.delete_all()
# Category.delete_all()
# Vendor.delete_all()
# Account.delete_all()


# categories
housekeeping = Category.new({'name' => 'housekeeping'})
gifts = Category.new({'name' => 'gifts'})
car = Category.new({'name' => 'car'})
fun = Category.new({'name' => 'fun'})

housekeeping.save()
gifts.save()
car.save()
fun.save()

# vendors
lidl = Vendor.new({'name' => 'Lidl'})
aldi = Vendor.new({'name' => 'Aldi'})
sainsburys = Vendor.new({'name' => 'Sainsburys'})
waitrose = Vendor.new({'name' => 'Waitrose'})

lidl.save()
aldi.save()
sainsburys.save()
waitrose.save()


# accounts: # extension
hbos = Account.new({'name' => "Bank of Scotland"})
hbos.save()

# transactions
amounts = [100, 500, 8700, 300]
amounts.each do |amount|
  t = Transaction.new({
    'amount' => amount,
    'category_id' => housekeeping.id,
    'vendor_id' => aldi.id,
    'account_id' => hbos.id
    })
  t.save()
end




binding.pry
nil
