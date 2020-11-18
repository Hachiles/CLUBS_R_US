class Booking < ApplicationRecord
  STATUS = ["Pending", "Accepted", "Declined"]
  belongs_to :club
  belongs_to :user
  # validates :start_time, :end_time, presence: true
  # validates :status, inclusion: { in: STATUS }
end
