class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action   :set_user
  before_action   :authenticate_user!
  before_action :prepare_meta_tags, if: "request.get?"


  def prepare_meta_tags(options={})
    defaults = {
      keywords:    %w[
        Actor\ dashboard
        Pelakon\ Peribadi
        Watak\ Pelakon
        Filem\ teater
        Film\ Theater
        Tablework
        Acting\ tools
        Acting\ class
        Character\ tools

        Actor\ developer
        Actor\ management
        Actor\ software
        watak\ peribadi
        pelakon\ rehearsal
        actor\ film
        Pelakon\ Filem
        Pembangunan\ watak
        Pengurusan\ Watak
        Pengurusan\ Filem
        Character\ development
        Papan\ Permuka\ Pelakon

        Actor\ software\ Tablework
        Actor\ development\ Tablework
        Pembangunan\ watak\ Tablework
        Pengurusan\ watak\ Tablework
        Character\ management\ tool
        Tablework\ rehearsal\ space
        Film\ development\ Tablework
      ]
    }
    options.reverse_merge!(defaults)
    set_meta_tags options
  end

  def index
    @characters = @user.characters
    @spaces = @user.spaces
  end

  def set_user
    @user = current_user if user_signed_in?
  end
end
