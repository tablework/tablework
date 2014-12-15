class CharactersController < ApplicationController

  before_action :set_user, only: [:index, :new]
  before_action  :authenticate_user!

  def index
  end

  def new
  end

  def set_user
    @user = current_user
  end

end
