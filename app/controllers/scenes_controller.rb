class ScenesController < ApplicationController
  before_action :find_space, only: [:new, :create]
  def index

  end

  def new
    @scene = @space.scenes.build
  end

  def create
    @scene = @space.scenes.build(scene_params)
    if @scene.save
      flash[:notice] = 'Scene created'
      redirect_to @space
    else
      flash.now[:error] = 'Scene creation fails'
      render :new
    end
  end

  private

  def scene_params
    params.require(:scene).permit(
      :title
    )
  end

  def find_space
    @space = Space.find(params[:space_id])
  end

  def find_scenable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
