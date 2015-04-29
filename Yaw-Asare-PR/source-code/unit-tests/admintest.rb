require_relative "../admin"
require 'test/unit'

class TestAdmin < Test::Unit::TestCase
  def setup
    @goodAdmin = Admin.new(12, "john doe")
    @badAdmin1 = Admin.new(12, 12)
    @badAdmin2 = Admin.new("12", "johndoe")
    @badAdmin3 = Admin.new(12, "")
    @badAdmin4 = Admin.new(nil, nil)
  end

  def testValidation
    assert(@goodAdmin.valid?)
    assert(!@badAdmin1.valid?)
    assert(!@badAdmin2.valid?)
    assert(!@badAdmin3.valid?)
    assert(!@badAdmin4.valid?)
  end
end
