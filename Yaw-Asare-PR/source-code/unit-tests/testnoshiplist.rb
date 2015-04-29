require_relative "../noshiplist"
require 'test/unit'

class TestNoShipList < Test::Unit::TestCase
  def setup
    @shiplist = NoShipList.new
    @badshiplist = NoShipList.new([""])
  end

  def testValidation
    assert(@shiplist.valid?)
    assert(!@badshiplist.valid?)
  end

  def testCanShip
    assert(@shiplist.canShip?("Illinois"))
    assert(@shiplist.canShip?("Wisconsin"))
    assert(!@shiplist.canShip?("Alabama"))
    assert(!@shiplist.canShip?("Utah"))
  end
end
