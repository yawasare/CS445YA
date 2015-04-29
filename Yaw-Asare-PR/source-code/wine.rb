require_relative 'note'


class Wine
  attr_accessor :id, :variety, :wineType, :labelName, :grape,
                :region, :country, :maker, :year,
                :numRatings, :rating, :notes

  def initialize(id, variety, wineType, labelName, grape, region,
                 country, maker, year)
    @id = id
    @variety = variety
    @wineType = wineType
    @labelName = labelName
    @grape  = grape
    @region = region
    @country = country
    @maker = maker
    @year = year
    @notes = []
  end

  def valid?
    if !@id || !@variety || !@wineType || !@labelName || !@grape ||
       !@region || !@country || !@maker || !@year
      return false
    elsif !@id.is_a?(Integer) || !@variety.is_a?(String) ||
          !@wineType.is_a?(String) || !@labelName.is_a?(String) ||
          !@grape.is_a?(String) || !@region.is_a?(String) ||
          !@country.is_a?(String) || !@maker.is_a?(String) ||
          !@year.is_a?(String)
      return false
    elsif @id < 1 || @variety.empty? || @wineType.empty? || @labelName.empty? ||
          @grape.empty? || @region.empty? || @country.empty? || @maker.empty? ||
          @year.empty?
      return false
    else
      return true
    end
  end

  def addNote?(note)
    if note.is_a?(Note)
      if note.valid?
        @notes.push(note)
        return true
      end
    end
    return false
  end

  def removeNote?(nid)
    for i in @notes
      if i.id == nid.to_i
        @notes.delete(i)
        return true
      end
    end
    return false
  end

  def getNote(nid)
    for i in @notes
      if i.id == nid.to_i
        return i
      end
    end
    return nil
  end
end
