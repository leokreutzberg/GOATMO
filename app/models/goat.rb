class Goat < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  validates :name, presence: true
end
