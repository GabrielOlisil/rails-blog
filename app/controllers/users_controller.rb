class UsersController < ApplicationController
  layout 'layouts/authentication', only: [:new]

  before_action :redirect_if_authenticated, only: %i[create new]
  before_action :authenticate!, except: %i[create new]

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

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(update_user_params)
      redirect_to profile_path
      return
    end

    render :edit, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:username, :email)
  end
end
