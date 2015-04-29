require_relative "user"
require_relative "address"

class Partner < User
  def initialize(id,name)
    super(id, name)
  end
end
