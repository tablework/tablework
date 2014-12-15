class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_user, only: [:index, :profile]
  before_action  :authenticate_user!

  def index

  end

  def dashboard

  end

  def set_user
  	@user = current_user if user_signed_in?
  end

end
