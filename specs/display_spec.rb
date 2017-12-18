require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/display.rb")

class TestCategory < MiniTest::Test

  def test_display_amount_gives_currency_string__10
    assert_equal('10.00', Display.amount(10))
  end

  def test_display_amount_gives_currency_string__1
    assert_equal('1.00', Display.amount(1))
  end

  def test_display_amount_gives_currency_string__10_10
    assert_equal('10.10', Display.amount(10.10))
  end

  def test_display_amount_gives_currency_string__237_05
    assert_equal('237.05', Display.amount(237.05))
  end

  def test_display_amount_returns_negative_numbers
  end

end
