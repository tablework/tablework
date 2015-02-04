require 'rails_helper'

RSpec.describe CharactersController, :type => :controller do
  let(:user) { create :user }
  let(:character) { create(:character, user: user)}

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

      it "should have correct Character variable" do
        get :new
        expect(assigns(:character)).to be_instance_of Character
      end

      it "should have a new record" do
       get :new
       expect(assigns(:character)).to be_new_record
      end
    end


    describe "#create" do
      context "without name error" do
        it "should have correct flash" do
          post :create, character: FactoryGirl.attributes_for(:character)
          expect(flash[:notice]).to eql 'Successfully added new characters'
        end

        it "should should have correct redirect" do
          post :create, character: FactoryGirl.attributes_for(:character)
          expect(response).to redirect_to root_path
        end
      end

      context "with name error" do
        it "should should render :new" do
          post :create, character: { name: '' }
          expect(response).to render_template 'characters/new'
        end
      end

    end

    describe "#show" do
      it "should have correct redirect" do
        get :show, id: character.id
        expect(response).to redirect_to root_path(character: character.id)
      end
    end

    describe "#assign space" do 
      it "should return the @character" do
        get :assign_space, id: character.id
        expect(assigns(:character)).to eq character
      end
    end

    describe "#update" do
      context "with valid attribute" do
        it "located the requested @character" do
          patch :update, id: character.id, character: attributes_for(:character)
          expect(assigns(:character)).to eq character
        end

        it "changes @character's attributes" do
          patch :update, id: character.id, character: attributes_for(:character, name: 'Kean Seng', description: 'Ruby Developer')
          character.reload
          expect(character.name).to eq 'Kean Seng'
          expect(character.description).to eq 'Ruby Developer'
        end

        it "redirects to the updated character" do
          patch :update, id: character.id, character: attributes_for(:character)
          expect(response).to redirect_to root_path
        end
      end

      context "with invalid attribute" do

        before(:each) do 
          request.env["HTTP_REFERER"] = "back"
        end
        
        it "does not update the character" do
          patch :update, id: character.id, character: { name: '' }
          character.reload
          expect(character.name).to eql character.name
        end

        it "re-renders the :edit template" do
          patch :update, id: character.id, character: { name: '' }
          expect(response).to redirect_to "back"
        end
      end
    end

    describe "#add note" do 
      it "should return the @character" do
        get :add_note, id: character.id
        expect(assigns(:character)).to eq character
      end
    end

    # describe "#create note" do 
    #   it "should have flash message" do
    #     post :create, id: note.id, note: FactoryGirl.attributes_for(:note)
    #     expect(flash[:notice]).to eq 'Notes saved'
    #   end
    # end

    # describe "#remove_note" do
    # end

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
