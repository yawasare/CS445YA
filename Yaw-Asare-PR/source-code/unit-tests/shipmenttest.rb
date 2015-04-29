require_relative "../shipment"
require_relative "../selection"
require_relative "../wine"
require 'test/unit'

class TestShipment < Test::Unit::TestCase
  def setup
    @goodwine1 = Wine.new(1,"aVariety","RW", "the label", "a grape",
                         "the region", "USA", "a maker", "year 1")
    @goodwine2 = Wine.new(2,"aVariety","RW", "the label", "a grape",
                         "the region", "USA", "a maker", "year 1")
    @goodwine3 = @goodwine1
    @goodwine4 = @goodwine2
    @goodwine5 = @goodwine1
    @goodwine6 = @goodwine2

    @badwine1 = Wine.new(-1, "aVariety","RW", "the label", "a grape",
                         "the region", "USA", "a maker", "year 1")

    @goodwines = [@goodwine1, @goodwine2, @goodwine3, @goodwine4,
                  @goodwine5, @goodwine6]
    @goodselection = Selection.new(2, "Aug", "AR", 45, @goodwines,
                                   1.20)
    @badselection1 = Selection.new(2, "Aug", "AR", nil, @goodwines,
                                   1.20)
    @goodshipment = Shipment.new(@goodselection, @goodselection.month + "/2015", "delivered")
    @badshipment1 = Shipment.new(@badselection, @goodselection.month + "/2015", "delevered")
    @badshipment2 = Shipment.new(@goodselection, nil, "delievered")
    @badshipment3 = Shipment.new(@goodselection, @goodselection.month + "/2015", "")
  end

  def testValidation
    assert(@goodshipment.valid?)
    assert(!@badshipment1.valid?)
    assert(!@badshipment2.valid?)
    assert(!@badshipment3.valid?)
  end
end
