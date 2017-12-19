require('pry-byebug')

require_relative('../models/category.rb')
require_relative('../models/vendor.rb')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')


Transaction.delete_all()
Category.delete_all()
Vendor.delete_all()
Account.delete_all()


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
rbs = Account.new({'name' => "Royal Bank of Scotland"})
rbs.save()

# transactions
amounts = [1.00, 5.00, 87.00, 3.00]
amounts.each do |amount|
  t = Transaction.new({
    'amount' => amount,
    'category_id' => fun.id,
    'vendor_id' => aldi.id,
    'account_id' => hbos.id,
    'transaction_date' => "2016-12-15"
    })
  t.save()
end

amounts.each do |amount|
  t = Transaction.new({
    'amount' => amount+15,
    'category_id' => housekeeping.id,
    'vendor_id' => lidl.id,
    'account_id' => hbos.id
    })
  t.save()
end

amounts.each do |amount|
  t = Transaction.new({
    'amount' => amount+7,
    'category_id' => gifts.id,
    'vendor_id' => waitrose.id,
    'account_id' => rbs.id
    })
  t.save()
end

amounts.each do |amount|
  t = Transaction.new({
    'amount' => amount*10,
    'category_id' => car.id,
    'vendor_id' => sainsburys.id,
    'account_id' => rbs.id
    })
  t.save()
end


binding.pry
nil
