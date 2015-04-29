require_relative "../selection"
require_relative "../wine"
require 'test/unit'


class TestSelection < Test::Unit::TestCase
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
    @badwines = [@goodwine1, @goodwine2, @goodwine3, @goodwine4,
                  @goodwine5,@badwine1]
    @goodselection = Selection.new(2, "Aug", "AR", 45, @goodwines,
                                   1.20)
    @badselection1 = Selection.new(2, "Aug", "AR", 45, @badwines,
                                   1.20)
    @badselection2 = Selection.new(2, "", "AR", 45, @goodwines,
                                   1.20)
    @badselection3 = Selection.new(2, "Aug", "", 45, @goodwines,  1.20)
    @badselection4 = Selection.new(2, "Aug", "AR", 45, nil, 1.20)

  end

  def testValidation
    assert(@goodselection.valid?)
    assert(!@badselection1.valid?)
    assert(!@badselection2.valid?)
    assert(!@badselection3.valid?)
    assert(!@badselection4.valid?)
  end
end
