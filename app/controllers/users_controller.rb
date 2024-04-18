class UsersController < ApplicationController
  layout "layouts/authentication"

  before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
