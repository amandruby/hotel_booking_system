class Room < ApplicationRecord
  belongs_to :room_category
  has_many :room_reservations, dependent: :destroy
  has_many :reservations, through: :room_reservations

  def self.search(query = nil)
    if query
      checkout = Date.parse(query[:checkout])
      checkin = Date.parse(query[:checkin])
      Room.where.not(id: Room.joins(:reservations).where("reservations.checkin <= ? AND reservations.checkout >= ?", checkin, checkout) )
    end
  end
  
end
