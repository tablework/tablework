class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    render layout: 'layouts/landing'
  end
end
