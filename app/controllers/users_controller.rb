class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Success!"
      redirect_to root_path
    else
      flash[:alert] = "There were errors!  Please try again."
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :phone, :password, :password_confirmation)
  end

end
