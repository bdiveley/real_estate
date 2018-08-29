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

end
