class Goat < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search,
                  against: [:name, :location],
                  using: {
                    tsearch: { prefix: true }
                  }

  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  validates :name, presence: true
end
