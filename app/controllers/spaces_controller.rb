class SpacesController < ApplicationController
  before_action :set_user

  def new
    @space = @user.spaces.build
  end

  def create
    @space = @user.spaces.build(space_params)
    if @space.save
      flash[:notice] = "Successfully added a new space."
      redirect_to root_path
    else
      flash.now[:error] = "Fails to add a new space. Please try again."
      render :new
    end
  end

  def set_user
    @user = current_user
  end

  def space_params
    params.require(:space).permit(
      :name, :type
    )
  end
end
