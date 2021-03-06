class BookingsController < ApplicationController
  def show
    @user = User.find(current_user.id)
    authorize @user
    @bookings = Booking.where(user_id: current_user.id)
    @clubs = Club.where(user_id: current_user.id).joins(:bookings)
  end
  
  def new
  end

  def create
    @club = Club.find(params[:club_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user_id = current_user.id
    @booking.club_id = params[:club_id]
    @booking.total_price = @booking.club.hourly_price.to_i * booking_params[:duration].to_i
    @booking.save

    redirect_to mybookings_path
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to mybookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :duration, :status)
  end
end
