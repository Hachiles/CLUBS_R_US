class BookingsController < ApplicationController
  def new
    @booking = Booking.new()
    @club = Club.find(params[:club_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user_id = current_user.id
    @booking.club_id = params[:club_id]
    @booking.save

    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
