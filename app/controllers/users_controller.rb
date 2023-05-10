class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end