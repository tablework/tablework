require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
  describe '#index' do
    it "should be success" do
      get :index
      expect(response).to be_success
    end
  end
end
