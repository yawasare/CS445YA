
require_relative "wine"
require "date"

class Selection
  attr_accessor :id, :month, :type, :createDate, :createdBy, :wines, :notes,
                :price

  def initialize(id, month, type, createdBy, wines, price)
    @id = id
    @month = month
    @type = type
    @createDate = DateTime.now.to_s
    @createdBy = createdBy
    @wines = wines
    @price = price
  end

  def valid?
    if !@id || !@month || !@type || !@createDate || !@createdBy || !@wines ||
       !@price
      return false
    elsif !@id.is_a?(Integer) || !@month.is_a?(String) ||!@type.is_a?(String) ||
          !@createDate.is_a?(String) || !@createdBy.is_a?(Integer) ||
          !@price.is_a?(Float) || !@wines.is_a?(Array)
      return false
    elsif @id < 1 || @type.empty? || @createDate.empty? || @createdBy < 1 ||
          @price < 0.0 || @month.empty?
      return false
    else
      for i in @wines
        if !i.valid?
          return false
        end
      end
      return true
    end
  end
end
