module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_if_authenticated
    redirect_to root_path, alert: 'You are already logged in.' if user_signed_in?
  end

  def authenticate!
    store_location
    redirect_to login_path, alert: 'You must be authenticated' unless user_signed_in?
  end

  def remember(user)
    user.regenerate_remember_token
    cookies.permanent.encrypted[:remember_token] = user.remember_token
  end

  def forget(user)
    cookies.delete :remember_token
    user.regenerate_remember_token
  end

  private

  def current_user
    Current.user ||= if session[:current_user_id].present?
                       User.find_by(id: session[:current_user_id])
                     else
                       cookies.permanent.encrypted[:remember_token].present?
                       User.find_by(remember_token: cookies.permanent.encrypted[:remember_token])
                     end
  end

  def store_location
    session[:user_return_to] = request.original_url if request.get? && request.local?
  end

  def user_signed_in?
    Current.user.present?
  end
end

