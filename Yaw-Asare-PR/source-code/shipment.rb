require_relative "wine"
require_relative "selection"

class Shipment < Selection
  attr_accessor :date, :status

  def initialize(selection, date, status)
    if selection.is_a?(Selection)
      if selection.valid?
        super(selection.id, selection.month, selection.type,
              selection.createdBy, selection.wines, selection.price)
            @date = date
        @status = status
      end
    end
  end

  def valid?
    if !super
      return false
    elsif !@date || !@status
      return false
    elsif !@date.is_a?(String) || !@status.is_a?(String)
      return false
    elsif @date.empty? || @status.empty?
      return false
    else
      return true
    end
  end
end
