class Event < ApplicationRecord
  has_many :bookings

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

end
