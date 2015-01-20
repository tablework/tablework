class ScenesController < ApplicationController
  before_action :find_scenable, only: [:new, :create]
  def new
    @scene = @scenable.scenes.build
    respond_to do |wants|
      wants.html
      wants.js
    end
  end

  def show
    redirect_to root_path(character: Scene.find(4).scenable_type.constantize.find(Scene.find(4).scenable_id))
  end

  def create
    @scene = @scenable.scenes.build(scene_params)
    if @scene.save
      if @scenable.instance_of? Character
        [
          'Where am i?',
          'when is it?',
          'where have i just come from?',
          'what do i want?',
          'why do i want it?',
          'why do i want it now?',
          "what happens if i don't get it now?",
          "what do i do to get what i want? by doing what?",
          "what are my obstacles?"
        ].each do |title|
          @scene.notes.create(title: title)
        end
      end
      flash[:notice] = 'Scene created'
      redirect_to @scenable || root_path
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
