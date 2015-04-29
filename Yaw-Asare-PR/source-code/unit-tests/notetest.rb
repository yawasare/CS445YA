require_relative "../note"
require 'test/unit'

class TestNote < Test::Unit::TestCase
  def setup
    @goodnote = Note.new(2, "May/2013", "this is a good note")
    @badnote1 = Note.new(-1, "May/2013", "this is a bad note")
    @badnote2 = Note.new(3, "May2013", nil)
    @badnote3 = Note.new(3, "", "this is a bad note")
    @badnote4 = Note.new(nil,nil,nil)
    @badnote5 = Note.new(0,"","")
  end

  def testValidation
    assert(@goodnote.valid?)
    assert(!@badnote1.valid?)
    assert(!@badnote2.valid?)
    assert(!@badnote3.valid?)
    assert(!@badnote4.valid?)
    assert(!@badnote5.valid?)
  end
end
