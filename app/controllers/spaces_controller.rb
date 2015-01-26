class SpacesController < ApplicationController
  before_action :set_user
  before_action :set_space, only: [:show, :destroy]

  def new
    @space = @user.spaces.build
  end

  def create
    @space = @user.owned_spaces.build(space_params)
    if @space.save
      flash[:notice] = "Successfully added a new space."
      redirect_to root_path
    else
      flash.now[:error] = "Fails to add a new space. Please try again."
      render :new
    end
  end

  def show
    @scene = @space.scenes.build
  end

  def destroy
    @space.destroy
    flash[:notice] = 'Space deleted.'
    redirect_to root_path
  end

  def set_user
    @user = current_user
  end

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(
      :name, :type_of_play
    )
  end
end
