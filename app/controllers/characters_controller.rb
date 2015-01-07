class CharactersController < ApplicationController

  before_action :set_user, only: [:index, :new, :create, :update, :assign_space]
  before_action  :authenticate_user!

  def index
  end

  def new
    respond_to do |format|
      format.html { @character = @user.characters.build }
      format.js
    end
  end

  def create
    @characters = @user.characters.build(character_params)
    if @characters.save
      flash[:notice] = 'Successfully added new characters'
      redirect_to root_path
    else
      render :edit
    end
  end

  def assign_space
    @character = @user.characters.find(params[:id])
  end

  def update
    @character = @user.characters.find(params[:id]) || not_found
    @character.update(params.require(:character).permit(:space_id, :description))
    if @character.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      redirect_to :back, notice: 'Fail to add space. Please try again.'
    end
  end

  def set_user
    @user = current_user
  end

  def character_params
    params.require(:character).permit(
      :name, :nationality, :DOB
    )
  end

end
