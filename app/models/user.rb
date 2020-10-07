class User < ApplicationRecord
  has_secure_password

  # All validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  # All associations
  has_many :reservations
  has_many :rooms, through: :reservations

end
