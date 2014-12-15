class UsersController < ApplicationController
  def show
    @user = current_user || not_found
  end
end
