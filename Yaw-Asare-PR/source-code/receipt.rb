require "date"

class Receipt
  attr_accessor :id, :date, :subId, :name, :price

  def initialize(id, date, subid, name, price)
    @id = id
    @date = date
    @subId = subid
    @name = name
    @price = price
  end

  def valid?
    if @id.nil? || @date.nil? || @subId.nil? || @name.nil? || @price.nil?
      return false
    elsif !@id.is_a?(Integer) || !@date.is_a?(String) ||
          !@subId.is_a?(Integer) || !@name.is_a?(String) || !@price.is_a?(Float)
      return false
    elsif @id < 1 || @subId < 1 || @name.empty? || @price < 0.0 || @date.empty?
      return false
    else
      return true
    end
  end
end
