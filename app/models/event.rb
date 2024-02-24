class Event < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :hobby
end
