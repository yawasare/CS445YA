
class User
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def valid?
    if id.nil? || !id.is_a?(Integer)
      return false
    elsif name.nil? || !name.is_a?(String) || name == "" || id < 1
      return false
    else
      return true
    end
  end
end
