require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/account.rb")

class TestAccount < MiniTest::Test

  def setup
    @account = Account.new({
      'name' => 'Clydesdale'
      })
  end

  def test_account_has_name
    assert_equal('Clydesdale', @account.name)
  end

end
