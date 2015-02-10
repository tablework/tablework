class StaticPagesController < ApplicationController
  include CharactersHelper
  skip_before_action :authenticate_user!
  def index
    render layout: 'layouts/landing'
  end

  def about
    render layout: 'layouts/landing'
  end

  def pricing
    render layout: 'layouts/landing'
  end
end
