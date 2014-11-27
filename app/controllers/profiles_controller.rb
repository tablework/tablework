class ProfilesController < ApplicationController
  before_action  :authenticate_user!
  def index
  	@user = current_user if user_signed_in?
  end
end
