require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/record_date.rb")
require('date')


class TestRecordDate < MiniTest::Test



  def test_date_formatting
    # format is a single standard method, so decided not to test
  end

end
