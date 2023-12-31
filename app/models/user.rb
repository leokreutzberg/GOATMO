class User < ApplicationRecord
  has_many :goats
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
