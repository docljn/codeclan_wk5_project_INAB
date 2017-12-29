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
credit_card = Account.new({'name' => "Credit Card"})
credit_card.save()
cash = Account.new({'name' => "Cash"})
cash.save()

# transactions

t = Transaction.new({
  'amount' => 5,
  'category_id' => fun.id,
  'vendor_id' => lidl.id,
  'account_id' => hbos.id,
  'transaction_date' => "2017-12-05"
  })
t.save()

t1 = Transaction.new({
  'amount' => 6,
  'category_id' => lending.id,
  'vendor_id' => jemma.id,
  'account_id' => cash.id,
  'transaction_date' => "2017-12-07"
  })
t1.save()

t2 = Transaction.new({
  'amount' => 7,
  'category_id' => gifts.id,
  'vendor_id' => aldi.id,
  'account_id' => credit_card.id,
  'transaction_date' => "2017-12-09"
  })
t2.save()

t3 = Transaction.new({
  'amount' => 8,
  'category_id' => car.id,
  'vendor_id' => sainsburys.id,
  'account_id' => hbos.id,
  'transaction_date' => "2017-12-11"
  })
t3.save()

t4 = Transaction.new({
  'amount' => 9,
  'category_id' => fun.id,
  'vendor_id' => waitrose.id,
  'account_id' => hbos.id,
  'transaction_date' => "2017-12-13"
  })
t4.save()

t5 = Transaction.new({
  'amount' => 11,
  'category_id' => lending.id,
  'vendor_id' => jemma.id,
  'account_id' => cash.id,
  'transaction_date' => "2017-12-15"
  })
t5.save()

t6 = Transaction.new({
  'amount' => 13,
  'category_id' => gifts.id,
  'vendor_id' => aldi.id,
  'account_id' => credit_card.id,
  'transaction_date' => "2017-12-17"
  })
t6.save()

t7 = Transaction.new({
  'amount' => 15,
  'category_id' => car.id,
  'vendor_id' => sainsburys.id,
  'account_id' => hbos.id,
  'transaction_date' => "2017-12-19"
  })
t7.save()

t8 = Transaction.new({
  'amount' => 20,
  'category_id' => gifts.id,
  'vendor_id' => sainsburys.id,
  'account_id' => credit_card.id,
  'transaction_date' => "2017-12-21"
  })
t8.save()

t9 = Transaction.new({
  'amount' => 1.45,
  'category_id' => lending.id,
  'vendor_id' => jemma.id,
  'account_id' => cash.id,
  'transaction_date' => "2017-12-23"
  })
t9.save()

t10 = Transaction.new({
  'amount' => 8.99,
  'category_id' => gifts.id,
  'vendor_id' => waitrose.id,
  'account_id' => hbos.id,
  'transaction_date' => "2017-12-24"
  })
t10.save()
