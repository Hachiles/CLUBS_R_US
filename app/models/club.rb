class Club < ApplicationRecord
  belongs_to :user
  validates :name, :capacity, :hourly_price, :address, :description, presence: true
  validates :name, uniqueness: true
  validates :capacity, :hourly_price, numericality: { only_integer: true }
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
