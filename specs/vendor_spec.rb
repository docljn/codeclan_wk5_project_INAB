require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/vendor.rb")

class TestVendor < MiniTest::Test

end
