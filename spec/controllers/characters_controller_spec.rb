require 'rails_helper'

RSpec.describe CharactersController, :type => :controller do
  let(:user) { create :user }

  context "when logged in" do
    before do
      sign_in :user, user
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "should be success" do
        get :new
        expect(response).to be_success
      end

      it "should have correct variable" do
        get :new
        expect(assigns(:character)).to be_instance_of Character
        expect(assigns(:character)).to be_new_record
      end
    end


    describe "#create" do
      context "with error" do
        it "should should render :new" do
          post :create, character: { name: '' }
          expect(response).to render_template 'characters/new'
        end
      end

      context "without error" do
        it "should have correct flash" do
          post :create, character: FactoryGirl.attributes_for(:character)
          expect(flash[:notice]).to eql 'Successfully added new characters'
        end

        it "should should have correct redirect" do
          post :create, character: FactoryGirl.attributes_for(:character)
          expect(response).to redirect_to root_path
        end
      end
    end

    describe "#show" do
      it "should have correct redirect" do
        character = create :character, user: user
        get :show, id: character.id
        expect(response).to redirect_to root_path(character: character.id)
      end
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
