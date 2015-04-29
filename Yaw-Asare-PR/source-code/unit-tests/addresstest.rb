require_relative "../address"
require 'test/unit'

class TestAddresss < Test::Unit::TestCase

    def setup
      @goodaddress1 = Address.new("35th & State St.","Chicago","Illinois",60616)
      @badaddress1  = Address.new("","Chicago","Illinois",60616)
      @badaddress2  = Address.new("35th & State St.","Chicago","Illinois",6061)
      @badaddress3  = Address.new(35, "Chicago", "illinois", 60655)
      @badaddress4  = Address.new("","","",10000)
    end

    def testValidation
      assert(@goodaddress1.valid?)
      assert(!@badaddress1.valid?)
      assert(!@badaddress2.valid?)
      assert(!@badaddress3.valid?)
      assert(!@badaddress4.valid?)
    end
end
