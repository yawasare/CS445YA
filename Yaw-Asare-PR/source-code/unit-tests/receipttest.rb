require_relative "../receipt"
require 'test/unit'

class TestReceipt < Test::Unit::TestCase
  def setup
    @goodreciept = Receipt.new(2, "03/23/2015", 43, "Josh doe", 25.99)
    @badreciept1 = Receipt.new(0, "03/23/2015", 43, "Josh doe", 25.99)
    @badreciept2 = Receipt.new(2, "", 43, "Josh doe", 25.99)
    @badreciept3 = Receipt.new(3, "03/08,2015", 43, nil, 25.99)
  end

  def testValidation
    assert(@goodreciept.valid?)
    assert(!@badreciept1.valid?)
    assert(!@badreciept2.valid?)
    assert(!@badreciept3.valid?)
  end
end
