require_relative "../user"
require 'test/unit'

class TestUser < Test::Unit::TestCase

  def setup
    @gooduser1 = User.new(12,"Mickey Mouse")
    @baduser1  = User.new(12,12)
    @baduser2  = User.new("","")
  end

  def testValidation
    assert(@gooduser1.valid?)
    assert(!@baduser1.valid?)
    assert(!@baduser2.valid?)
  end

end
