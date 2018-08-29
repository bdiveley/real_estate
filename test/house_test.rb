require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'
require 'pry'

class HouseTest < Minitest::Test

  def test_instance_of_house_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_price_of_house
    house = House.new("$400000", "123 sugar lane")

    assert_equal 400000, house.price
  end

  def test_address_of_house
    house = House.new("$400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end

  def test_house_has_no_rooms
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_add_room_to_house
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)

    assert_equal [room_1], house.add_room(room_1)
  end

  def test_another_room_to_house
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)

    house.add_room(room_1)

    assert_equal [room_1, room_2], house.add_room(room_2)
  end

  def test_house_has_all_rooms_added
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
  end

  def test_only_return_bedrooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
  end

  def test_only_return_basements
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_4], house.rooms_from_category(:basement)
  end

  def test_calc_area_of_house_correctly
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end

end
