class CharactersController < ApplicationController

  before_action :set_user, only: [:index, :new, :create, :update, :assign_space, :add_note, :create_note, :show, :edit, :summary, :share, :share_form]
  before_action  :authenticate_user!, except: :summary

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

  def summary
    @character = Character.find(params[:id]) || not_found
    respond_to do |wants|
      wants.html
      wants.pdf do
        begin
          # create an API client instance
          client = Pdfcrowd::Client.new("rajahafify", "887e9e96ccc7c99845126bdae228f312")
          # convert a web page and store the generated PDF to a variable
          pdf = client.convertURI("https://www.tablework.com/characters/#{@character.id}/summary")
          # send the generated PDF
          send_data(pdf, 
                    :filename => "character.pdf",
                    :type => "application/pdf",
                    :disposition => "attachment")
        rescue Pdfcrowd::Error => why
          render :text => why
        end
      end
    end
  end

  def share_form
    @character = @user.characters.find(params[:id])
  end

  def share
    redirect_to root_path(character: Character.find(params[:id])), notice: 'PDF shared'
  end

  def assign_space
    @character = @user.characters.find(params[:id])
  end

  def edit
    @character = @user.characters.find(params[:id]) || not_found
  end

  def update
    @character = @user.characters.find(params[:id]) || not_found
    @character.update(character_params)
    if @character.save
      respond_to do |format|
        format.html { redirect_to root_path(character: @character.id) }
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
    @note = Note.find(params[:id])
    @note_id = @note.id
    @note.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = 'Notes removed'
        redirect_to :back
      end
      format.js
    end
  end

  def destroy
    character = Character.find(params[:id])
    character.destroy
    redirect_to root_path, notice: 'Character deleted'
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
