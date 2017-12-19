require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/transaction.rb")
require_relative("../models/account.rb")
require_relative("../models/category.rb")
require_relative("../models/vendor.rb")


class TestTransaction < MiniTest::Test

  def setup
    @vendor = Vendor.new({
      'name' => 'Lidl',
      'id' => '2'
      })

    @category = Category.new({
      'name' => 'Housekeeping',
      'id' => '1'
      })

    @transaction = Transaction.new({
      'amount' => 100,
      'comment' => 'too expensive',
      'category_id' => @category.id,
      'vendor_id' => @vendor.id
      })
  end

  def test_transaction_has_amount
    assert_equal(100, @transaction.amount)
  end

  def test_transaction_has_category_id
    assert_equal(1, @transaction.category_id)
  end

  def test_transaction_has_vendor_id
    assert_equal(2, @transaction.vendor_id)
  end

  def test_transaction_has_comment
    assert_equal('too expensive', @transaction.comment)
  end

  def test_transaction_has_no_date_before_save_to_db
    assert_nil(@transaction.transaction_date)
  end

  def test_transaction_has_date_after_save_to_db
    skip
    # stuck!
  end



end
