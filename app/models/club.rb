class Club < ApplicationRecord
  belongs_to :user
  validates :name, :capacity, :hourly_price, :address, :description, presence: true
  validates :name, uniqueness: true
  validates :capacity, :hourly_price, numericality: { only_integer: true }
end
