
class Address

  attr_accessor :street, :city, :state, :zip

  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def valid?
    if street.nil? || !street.is_a?(String)
      return false
    elsif city.nil? || !city.is_a?(String)
      return falsse
    elsif state.nil? || !city.is_a?(String)
      return false
    elsif zip.nil? || !zip.is_a?(Integer)
      return false
    elsif street.empty? || city.empty? || state.empty? || zip < 10000
      return false
    else
      return true
    end
  end

end
