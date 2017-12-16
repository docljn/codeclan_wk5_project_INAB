require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/category.rb")

class TestCategory < MiniTest::Test

  def setup
    @food = Category.new({'name' => 'food'})
  end

  def test_category_has_name
    assert_equal('food', @food.name)
  end

end
