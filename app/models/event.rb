class Event < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :hobby
  has_many :reviews, dependent: :destroy
end
