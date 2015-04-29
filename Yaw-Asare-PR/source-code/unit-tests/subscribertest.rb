require_relative "../subscriber"
require_relative "../address"
require 'test/unit'

class TestSubscriber < Test::Unit::TestCase

  def setup
    @goodaddress = Address.new("IIT","Chicago","Illinois",60655)
    @badaddresss = Address.new("","","",0)

    @goodSub1 = Subscriber.new(12, "john smith", "john@gmail.com",
                                    "773-123-4567",@goodaddress)
    @badSub1  = Subscriber.new(13, "", "", "", @goodaddress)
    @badSub2  = Subscriber.new("13", "johny", "johny.@gmail.com",
                                    "737-484-2932", @goodaddress)
    @badSub3  = Subscriber.new(13,24,"24@gmail.com","2453523",@goodaddress)
    @badSub4  = Subscriber.new(25,"kenny","ken@gmail.com",
                                      "816-231-0223", @badaddress)
  end

  def testValidation
    assert(@goodSub1.valid?)
    assert(!@badSub1.valid?)
    assert(!@badSub2.valid?)
    assert(!@badSub3.valid?)
    assert(!@badSub4.valid?)
  end

end
