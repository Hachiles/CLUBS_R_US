class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    authorize @user
    @clubs = Club.where(user_id: current_user.id)
  end

  def myclubs
  end
end
