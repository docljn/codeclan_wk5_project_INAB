require("minitest/autorun")
require ("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/vendor.rb")

class TestVendor < MiniTest::Test

  def setup
    @lidl = Vendor.new({
      'name' => 'Lidl'
      })
  end

  def test_vendor_has_name
    assert_equal('Lidl', @lidl.name)
  end

end
