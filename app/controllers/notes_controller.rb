class NotesController < ApplicationController
  before_action :find_notable, only: [:new, :create, :edit, :update, :destroy]
  def new
    @note = @notable.notes.build
  end

  def create
    @space = Space.find(params[:space_id]) if params[:space_id].present?
    @note = @notable.notes.build(note_params)

    respond_to do |wants|
      if @note.save
        @note.user = current_user
        @note.save
        flash[:notice] = 'Note created'
        wants.html { redirect_to @notable || root_path(character: @notable) }
        wants.js
      else
        flash.now[:error] = 'Note creation fails'
        wants.html { render :new }
        wants.js
      end
    end            
  end

  def edit
    @space = Space.find(params[:space_id]) if params[:space_id]
    @note = @notable.notes.find(params[:id])
  end

  def update
    @space = Space.find(params[:space_id]) if params[:space_id]
    @note = @notable.notes.find(params[:id])
    @note.update(note_params)
      if @note.save
        flash[:notice] = 'Note edited'
        if @notable.try(:scenable).instance_of? Character
          redirect_to view_all_scene_path(@notable)
        else
          redirect_to @notable
        end
      else
        flash.now[:error] = 'Note editing fails'
        render :edit
      end
  end

  def destroy
    @note = @notable.notes.find(params[:id])
    @note.destroy
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(
      :title, :text, :image, :link, :link_html
    )
  end

  def find_notable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @notable = $1.classify.constantize.find(value)
      end
    end
  end
end
