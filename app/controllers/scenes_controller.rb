class ScenesController < ApplicationController
  before_action :find_scene, only: [:show, :destroy, :assign_cast, :edit, :update]
  before_action :find_scenable, only: [:new, :create, :show, :destroy, :edit, :update]
  def new
    @scene = @scenable.scenes.build
    respond_to do |wants|
      wants.html
      wants.js
    end
  end

  def show
    if @scenable.instance_of? Space
      redirect_to @scenable
    else
      redirect_to root_path(character: @scenable)
    end
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

  def edit
  end

  def update
    @scene.update(scene_params)
    if @scene.save
      redirect_to @scenable || root_path
    else
      render :edit
    end
  end

  def destroy
    @scene.destroy
    redirect_to @scenable || root_path
  end

  def assign_cast
    @scene_membership = @scene.scene_memberships.build
  end

  private

  def scene_params
    params.require(:scene).permit(
      :title
    )
  end

  def find_scene
    @scene = Scene.find(params[:id]) || Scene.new
  end

  def find_scenable
    if @scene
      @scenable = @scene.scenable_type.constantize.find(@scene.scenable_id)
    else
      params.each do |name, value|
        if name =~ /(.+)_id$/
          @scenable = $1.classify.constantize.find(value)
        end
      end
    end
  end
end
