require_relative "../wine"
require_relative "../note"
require 'test/unit'

class TestWine < Test::Unit::TestCase

  def setup
    @goodwine = Wine.new(1,"aVariety","RW", "the label", "a grape",
                         "the region", "USA", "a maker", "year 1")
    @badwine1 = Wine.new(1, "", "RW", "the label", "a grape",
                         "the region", "USA", "a maker", "year 1")
    @badwine2 = Wine.new(nil,"aVariety","RW", "the label", "a grape",
                         "the region", "USA", "a maker", "year 1" )
    @badwine3 = Wine.new(20, "","","","","","","","")

    @goodnote = Note.new(2, "May/2013", "a Good note")
    @badnote = Note.new(2, "", "a bad note")
  end

  def testValidation
    assert(@goodwine.valid?)
    assert(!@badwine1.valid?)
    assert(!@badwine2.valid?)
    assert(!@badwine3.valid?)
  end

  def testAddGoodNote
    assert(@goodwine.notes.empty?)
    @goodwine.addNote?(@goodnote)
    assert(!@goodwine.notes.empty?)
    assert_equal(1, @goodwine.notes.length)
  end

  def testAddBadNote
    assert(@goodwine.notes.empty?)
    @goodwine.addNote?(@badnote)
    assert(@goodwine.notes.empty?)
  end

  def testGetNote
    @goodwine.addNote?(@goodnote)
    note = @goodwine.getNote(2)
    assert_equal(@goodnote, note)
  end

  def testRemoveNote
    @goodwine.addNote?(@goodnote)
    assert_equal(1,@goodwine.notes.length)
    removal = @goodwine.removeNote?(2)
    assert(removal)
    assert(@goodwine.notes.empty?)
  end
end
