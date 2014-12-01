require 'rails_helper'

RSpec.describe CharactersController, :type => :controller do
  context "when logged in" do 
    
    describe "GET index" do
    
    login_user
      it "returns http success" do
        get :index
        expect(response).to be_success
      end
    end

    describe "GET new" do
      it "returns http success" #do
        #get :new
        #expect(response).to be_success
      #end
    end
  end

  context "when logged out " do
    describe "GET index" do
    
      it "redirects to root" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
