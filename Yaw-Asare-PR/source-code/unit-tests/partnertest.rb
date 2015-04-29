require_relative "../partner"
require 'test/unit'

class TestPartner < Test::Unit::TestCase
  def setup
    @goodPartner = Partner.new(1, "A Partner")
    @badPartner1 = Partner.new(nil, "A Parter")
    @badPartner2 = Partner.new(1, nil)
    @badPartner3 = Partner.new(1, "")
    @badPartner4 = Partner.new(0, "A Partner")
  end

  def testValidation
    assert(@goodPartner.valid?)
    assert(!@badPartner1.valid?)
    assert(!@badPartner2.valid?)
    assert(!@badPartner3.valid?)
    assert(!@badPartner4.valid?)
  end
end
