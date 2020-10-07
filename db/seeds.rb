# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


room_categories =[
  {
    name: "Deluxe Rooms",
    detail: "Queen Size Bed",
    price: 100
  },
  {
    name: "Luxury Rooms",
    detail: "Queen Size Bed and Pool Facing",
    price: 150
  },
  {
    name: "Luxury Suites",
    detail: "King Size Bed and Pool Facing",
    price: 175
  },
  {
    name: "Presidential Suites",
    detail: "King Size Bed, Pool Facing with a Gym",
    price: 200
  },
]

room_categories.each do |room_category|
  RoomCategory.find_or_create_by(name: room_category[:name]) do |rc|
    rc.detail = room_category[:detail]
    rc.price = room_category[:price]
  end
end

delux = RoomCategory.find_by(name: "Deluxe Rooms")
luxury = RoomCategory.find_by(name: "Luxury Rooms")

series = ["A", "B", "C", "D"]
rooms = []

series.each do |s|
  5.times do |i|
    rooms << {
        room_no: "#{s}#{i}",
        room_category_id: delux.id,
        created_at: Time.now,
        updated_at: Time.now
      }
  end
  (6..10).each do |i|
    rooms << {
        room_no: "#{s}#{i}",
        room_category_id: luxury.id,
        created_at: Time.now,
        updated_at: Time.now
      }
  end
end

series = ["D"]
luxury_suite = RoomCategory.find_by(name: "Luxury Suites")

series.each do |s|
  (11..20).each do |i|
    rooms << {
        room_no: "#{s}#{i}",
        room_category_id: luxury_suite.id,
        created_at: Time.now,
        updated_at: Time.now
      }
  end
end

(1..2).each do |i|
  rooms << {
    room_no: "E#{i}",
    room_category_id: luxury_suite.id,
    created_at: Time.now,
    updated_at: Time.now
  }
end

series = ["E"]
presidental_suite = RoomCategory.find_by(name: "Presidential Suites")

series.each do |s|
  (3..10).each do |i|
    rooms << {
      room_no: "#{s}#{i}",
      room_category_id: presidental_suite.id,
      created_at: Time.now,
      updated_at: Time.now
    }
  end
end

# This is dangerous but I am just using for demo purpose
Room.destroy_all

Room.create(rooms)