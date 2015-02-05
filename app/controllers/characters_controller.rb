class CharactersController < ApplicationController

  before_action :set_user, only: [:index, :new, :create, :update, :assign_space, :add_note, :create_note, :show]
  before_action  :authenticate_user!

  def index
  end

  def new
    respond_to do |format|
      format.html { @character = @user.characters.build }
      format.js
    end
  end

  def show
    redirect_to root_path(character: Character.find(params[:id]))
  end

  def create
    @characters = @user.characters.build(character_params)
    if @characters.save
      flash[:notice] = 'Successfully added new characters'
      redirect_to root_path
    else
      render :new
    end
  end

  def assign_space
    @character = @user.characters.find(params[:id])
  end

  def update
    @character = @user.characters.find(params[:id]) || not_found
    @character.update(character_params)
    if @character.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      redirect_to :back, notice: 'Fail to add space. Please try again.'
    end
  end

  def add_note
    @character = @user.characters.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_note
    @character = @user.characters.find(params[:id])
    @note = @character.notes.build(notes_params)
    respond_to do |format|
      if @note.save
        flash[:notice] = 'Notes saved'
        format.html { redirect_to root_path(character: @character) }
        format.js
      else
        format.html { render :add_note }
      end
    end
  end

  def remove_note
    p Note.count
    @note = Note.find(params[:id])
    @note_id = @note.id
    @note.destroy
    p Note.count
    respond_to do |format|
      format.html do
        flash[:notice] = 'Notes removed'
        redirect_to :back
      end
      format.js
    end
  end

  private

    def set_user
      @user = current_user
    end

    def character_params
      params.require(:character).permit(
        :name, :nationality, :DOB, :gender, :image, :description, :space_id
      )
    end

    def notes_params
      params.require(:note).permit(
        :title, :text, :image, :link
       )
    end
end
