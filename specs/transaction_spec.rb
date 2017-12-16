require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/transaction.rb")

class TestTransaction < MiniTest::Test
  
end
