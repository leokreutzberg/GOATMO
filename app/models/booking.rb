class Booking < ApplicationRecord
  has_one :review, dependent: :destroy
  belongs_to :user
  belongs_to :goat

  before_validation :set_price, on: :create

  validates :start_date, :end_date, presence: true

  def set_price
    self.price = calculate_total_price
  end

  def calculate_total_price
    if goat.present? && start_date.present? && end_date.present?
      duration = (end_date - start_date).to_i + 1
      daily_price = goat.price
      total_price = duration * daily_price
      return total_price
    else
      return nil
    end
  end

  def calculate_total_days
    if goat.present? && start_date.present? && end_date.present?
      duration = (end_date - start_date).to_i + 1
      return duration
    end
  end
end
