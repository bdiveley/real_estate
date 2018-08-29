class Room
  attr_accessor :category,
                :area

  def initialize(category, length, width)
    @category = category
    @area = length * width
  end
  
end
