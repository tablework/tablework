class SpacesController < ApplicationController
  before_action :set_user
  before_action :set_space, only: [:edit, :update, :show, :destroy]

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

  def edit
  end
  
  def update
    @space.update(space_params)
    if @space.save
      flash[:notice] = "Successfully edited space."
      redirect_to @space
    else
      flash.now[:error] = "Fails to edit space. Please try again."
      render :edit
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

  private

  def set_user
    @user = current_user
  end

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(
      :name, :type_of_play, :image
    )
  end
end
