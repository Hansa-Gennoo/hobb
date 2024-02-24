class Hobby < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  accepts_nested_attributes_for :chatroom
end
