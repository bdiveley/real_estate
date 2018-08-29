class House
    attr_accessor :price,
                  :address,
                  :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(room_type)
    @rooms.find_all do |room|
      room.category == room_type
    end
  end

  def area
    @rooms.reduce(0) do |sum, room|
      sum + room.area
    end
  end

  def price_per_square_foot
    square_feet = @price / area.to_f
    square_feet.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end
  end

  def rooms_by_category
    test = @rooms.group_by do |room|
      room.category
    end
  end

end
