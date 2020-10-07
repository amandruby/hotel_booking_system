class Reservation < ApplicationRecord
  belongs_to :user
  has_many :room_reservations, dependent: :destroy
  has_many :rooms, through: :room_reservations

  validate :advanced_reservation_period

  def advanced_reservation_period
    diff = (self.checkin.to_date - DateTime.now.to_date).to_i
    if diff > (6 * 30)
      self.errors.add(:base, "Only 6 months advance reservation is allowed")
    end
  end

end
