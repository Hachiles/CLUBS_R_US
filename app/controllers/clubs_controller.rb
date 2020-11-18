class ClubsController < ApplicationController
  
  def index
    @clubs = policy_scope(Club).order(created_at: :desc)
  end
  
  def show
    @club = Club.find(params[:id])
    authorize @club
  end
  
  def new
    @club = Club.new()
    authorize @club
  end

  def create
    @club = Club.new(club_params)
    authorize @club
    @club.user = current_user
    if @club.save
      redirect_to club_path(@club)
    else
      render :new
    end

    redirect_to club_path(@club)
  end

  def edit
    @club = Club.find(params[:id])
    authorize @club
  end

  def update
    @club = Club.find(params[:id])
    authorize @club
    if @club.update(club_params)
      redirect_to club_path(@club)
    else
      render :edit
    end
  end

  def destroy
    @club = Club.find(params[:id])
    authorize @club
    @club.destroy
    redirect_to clubs_path
  end

  private

  def club_params
    params.require(:club).permit(:name, :capacity, :hourly_price, :address, :description, :photo)
  end
end
