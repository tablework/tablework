class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action   :set_user
  before_action   :authenticate_user!

  def index
    @characters = @user.characters
    @spaces = @user.spaces
  end

  def set_user
    @user = current_user if user_signed_in?
  end
end
