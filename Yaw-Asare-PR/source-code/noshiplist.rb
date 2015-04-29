
class NoShipList
  attr_accessor :states

  def initialize(list = nil)
    if list == nil
      @states = ["Alabama", "Arkansas", "Delaware", "Kentuky",
                 "Massachusetts","Mississippi","Oklahoma",
                 "Pensilvania", "South Dakota", "Utah"]
    else
      @states = list
    end
  end

  def valid?
    if !@states
      return false
    else
      for state in @states
        if !state.is_a?(String)
          return false
        elsif state.empty?
          return false
        end
      end
    end
    return true
  end

  def canShip?(state)
    return !@states.include?(state)
  end

end
