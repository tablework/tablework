require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
  describe '#index' do
    it "should be success" do
      get :index
      expect(response).to be_success
    end

    it "should have correct layout" do
      get :index
      expect(response).to render_template("layouts/landing")
    end
  end

  describe "#about" do
    it  "should be success" do
      get :about
      expect(response).to be_success
    end

    it  "should have correct layout" do
      get :about
      expect(response).to render_template("layouts/landing")
    end
  end

  describe "#pricing" do
    it "should be be_success" do
      get :pricing
      expect(response).to be_success
    end

    it "should have correct layout" do
      get :pricing
      expect(response).to render_template("layouts/landing")
    end
  end
end
