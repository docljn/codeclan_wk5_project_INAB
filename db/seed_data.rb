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
lending = Category.new({'name' => 'lending'})
gifts = Category.new({'name' => 'gifts'})
car = Category.new({'name' => 'car'})
fun = Category.new({'name' => 'fun'})

lending.save()
gifts.save()
car.save()
fun.save()

[gifts, car, fun].each do |category|
  category.budget = 200
  category.save()
end

# vendors
lidl = Vendor.new({'name' => 'Lidl'})
aldi = Vendor.new({'name' => 'Aldi'})
sainsburys = Vendor.new({'name' => 'Sainsburys'})
waitrose = Vendor.new({'name' => 'Waitrose'})
jemma = Vendor.new({'name' => 'Jemma'})

lidl.save()
aldi.save()
sainsburys.save()
waitrose.save()
jemma.save()


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
    'transaction_date' => "2017-12-05"
    })
  t.save()
end

amounts.each do |amount|
  t = Transaction.new({
    'amount' => amount/4,
    'category_id' => lending.id,
    'vendor_id' => jemma.id,
    'account_id' => hbos.id,
    'transaction_date' => "2017-12-07"

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
    'amount' => amount*2,
    'category_id' => car.id,
    'vendor_id' => sainsburys.id,
    'account_id' => rbs.id
    })
  t.save()
end
