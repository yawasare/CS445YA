
class Note
  attr_accessor :id, :date, :content
  def initialize(id, date, content)
      @id = id
      @date = date
      @content = content
  end

  def valid?
    if id.nil? || date.nil? || content.nil?
      return false
    elsif !id.is_a?(Integer) || !date.is_a?(String) || !content.is_a?(String)
      return false
    elsif id < 0 || date.empty? || content.empty?
      return false
    else
      return true
    end
  end

end
