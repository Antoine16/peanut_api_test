class UsersController < ApplicationController

  def show
    @users = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :phone, :email )
  end
end
