require_relative "user"
require_relative "address"

class Subscriber < User
  attr_accessor :email, :phone, :address

  def initialize(id, name, email, phone, address)
    super(id,name)
    @email = email
    @phone = phone
    @address = address
  end

  def valid?
    if !super
      return false
    elsif email.nil? || phone.nil? || address.nil?
      return false
    elsif !email.is_a?(String) || !phone.is_a?(String) || !address.is_a?(Address)
      return false
    elseif email.empty? || phone.empty? || !address.valid?
      return false
    else
      return true
    end
  end
end
