require_relative "user"
require_relative "address"

class Admin < User
  def initialize(id, name)
    super(id, name)
  end
end
