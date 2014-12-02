class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :phone_number, :gender, :description, :birthday)
  end

  def set_user
    @user = current_user
  end


end
