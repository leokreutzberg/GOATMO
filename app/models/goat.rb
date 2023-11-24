class Goat < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search,
                  against: [:name, :location],
                  using: {
                    tsearch: { prefix: true }
                  }

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  belongs_to :user

  has_one_attached :photo

  validates :name, presence: true
  validates :description, length: { maximum: 255 }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
