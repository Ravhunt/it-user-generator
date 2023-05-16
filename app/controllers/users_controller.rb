class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    if session[:user_id].present?
      @user = User.find(session[:user_id])
      clear_user_data
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def clear_user_data
    @user = User.find(params[:id])
    @user.delete
  end
end
