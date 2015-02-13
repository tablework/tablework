class StaticPagesController < ApplicationController
  include CharactersHelper
  skip_before_action :authenticate_user!
  def index
    if signed_in?
      redirect_to dashboard_path(character: params[:character])
    else
      render layout: 'layouts/landing'
    end
  end

  def about
    render layout: 'layouts/landing'
  end

  def pricing
    render layout: 'layouts/landing'
  end
end
