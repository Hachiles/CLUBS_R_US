class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    authorize @user
    @bookings = Booking.where(user_id: current_user.id)
    @clubs = Club.where(user_id: current_user.id).joins(:bookings)
  end
end
