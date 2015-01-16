class ScenesController < ApplicationController
  before_action :find_scenable, only: [:new, :create]
  def new
    @scene = @scenable.scenes.build
    respond_to do |wants|
      wants.html
      wants.js
    end
  end

  def create
    @scene = @scenable.scenes.build(scene_params)
    if @scene.save
      flash[:notice] = 'Scene created'
      redirect_to @scenable
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

  def find_scenable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @scenable = $1.classify.constantize.find(value)
      end
    end
  end
end
