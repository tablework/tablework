require 'rails_helper'

RSpec.describe CharactersController, :type => :controller do
  let(:user) { create :user }
  let(:character) { create(:character, user: user)}
  let!(:note) { create :note }

  context "when logged in" do
    before do
      sign_in :user, user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to be_success
      end
    end

    describe "GET #new" do
      it "assigns a new record" do
       get :new
       expect(assigns(:character)).to be_a_new(Character)
      end

      it "should have correct character variable" do
        get :new
        expect(assigns(:character)).to be_instance_of Character
      end

      it "should return success" do
        get :new
        expect(response).to be_success
      end
    end


    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new character in database" do
          expect {
            post :create, character: attributes_for(:character) 
          }.to change(Character, :count).by(1)
        end

        it "should have correct flash" do
          post :create, character: attributes_for(:character)
          expect(flash[:notice]).to eql 'Successfully added new characters'
        end

        it "should have correct redirect" do
          post :create, character: attributes_for(:character)
          expect(response).to redirect_to root_path
        end
      end

      context "without valid attributes" do
        it "does not save the new character into database" do
          expect {
            post :create, character: attributes_for(:character, name: nil) 
          }.to_not change(Character, :count)
        end  

        it "should render :new" do
          post :create, character: { name: '' }
          expect(response).to render_template 'characters/new'
        end
      end

    end

    describe "GET #show" do
      it "should have redirect to the root_path" do
        get :show, id: character
        expect(response).to redirect_to root_path(character: character.id)
      end
    end

    describe "GET #assign space" do 
      it "should return the @character" do
        get :assign_space, id: character.id
        expect(assigns(:character)).to eq character
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        it "locates the requested @character" do
          patch :update, id: character, character: attributes_for(:character)
          expect(assigns(:character)).to eq character
        end

        it "changes @character's attributes" do
          patch :update, id: character, character: attributes_for(:character, name: 'Kean Seng', description: 'Ruby Developer')
          character.reload
          expect(character.name).to eq 'Kean Seng'
          expect(character.description).to eq 'Ruby Developer'
        end

        it "redirects to the updated character" do
          patch :update, id: character, character: attributes_for(:character)
          expect(response).to redirect_to root_path
        end
      end

      context "with invalid attributes" do

        before(:each) do 
          request.env["HTTP_REFERER"] = "back"
        end
        
        it "does not update the character" do
          patch :update, id: character, character: { name: '' }
          character.reload
          expect(character.name).to eql character.name
        end

        it "re-renders the :edit template" do
          patch :update, id: character, character: { name: '' }
          expect(response).to redirect_to "back"
        end
      end
    end

    describe "GET #add note" do 
      
      it "should return the @character" do
        get :add_note, id: character
        expect(assigns(:character)).to eq character
      end

    end

    describe "#create note" do 
      context "with valid attributes" do
        it "saves the new note in database" do
            expect {
              post :create_note, id: character, note: attributes_for(:note) 
            }.to change(Note, :count).by(1)
          end

        it "should have flash message" do
          post :create_note, id: character, note: attributes_for(:note)
          expect(flash[:notice]).to eq 'Notes saved'
        end

        it "should have correct redirect" do
            post :create_note, id: character, note: attributes_for(:note)
            expect(response).to redirect_to root_path(character: character.id)
        end
      end

      context "with invalid attributes" do
        it "does not save the new note into database" do
          expect {
            post :create_note, id: character, note: attributes_for(:note, title: nil) 
          }.to_not change(Note, :count)
        end 

        it "should render :add_note" do
          post :create_note, id: character, note: { title: '' }
          expect(response).to render_template :add_note
        end
      end
    end

    describe "#remove_note" do

      before(:each) do 
        request.env["HTTP_REFERER"] = "back"
      end

      it "deletes a note in database" do
        expect {
          delete :remove_note, id: note
        }.to change(Note, :count).by(-1)
      end

      it "should have a flash message" do
        delete :remove_note, id: note
        expect(flash[:notice]).to eq 'Notes removed'
      end

      it "should have correct redirect" do
        delete :remove_note, id: note
        expect(response).to redirect_to "back"
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
