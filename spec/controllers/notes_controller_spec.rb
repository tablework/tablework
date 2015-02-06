require 'rails_helper'

RSpec.describe NotesController, :type => :controller do
let!(:user) { create :user }
let!(:space) { create :space }
let!(:scene) { create :scene, scenable_id: space.id, scenable_type: "Space"}
let!(:note) { create :note, notable_id: scene.id, notable_type: "Scene" }


  context "when logged in" do
    before do
      sign_in :user, user
    end

    describe "GET #new" do
      it "assigns a new note" do
        get :new, space_id: space, scene_id: scene
        expect(assigns(:note)).to be_a_new(Note)
      end

      it "should have correct space variable" do
        get :new, space_id: space, scene_id: scene
        expect(assigns(:note)).to be_instance_of Note
      end

      it "should return success" do
        get :new, space_id: space, scene_id: scene
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new note in database" do
          expect {
            post :create, space_id: space, scene_id: scene, note: attributes_for(:note)
          }.to change(Note, :count).by(1)
        end

        it "should have correct flash" do
          post :create, space_id: space, scene_id: scene, note: attributes_for(:note)
          expect(flash[:notice]).to eql 'Note created'
        end

        it "should have correct redirect" do
          post :create, space_id: space, scene_id: scene, note: attributes_for(:note)
          expect(response).to redirect_to note.notable
        end
      end

      context "without valid attributes" do
        it "does not save the new note into database" do
          expect {
            post :create, space_id: space, scene_id: scene, note: attributes_for(:note) 
          }.to_not change(Character, :count)
        end 

        it "should show the flash" do
          post :create, space_id: space, scene_id: scene, note: attributes_for(:note, title: '') 
          expect(flash[:error]).to eq "Note creation fails" 
        end 

        it "should render :new" do
          post :create, space_id: space, scene_id: scene, note: attributes_for(:note, title: '')
          expect(response).to render_template :new
        end
      end
    end

    describe "GET #edit" do
      it "should return @note" do
        get :edit, space_id: space, scene_id: scene, id: note
        expect(assigns(:note)).to eq note
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do

        it "changes @note's attributes" do
          patch :update, space_id: space, scene_id: scene, id: note, note: attributes_for(:note, title: 'Kean Seng', text: 'Ruby Developer')
          note.reload
          expect(note.title).to eq 'Kean Seng'
          expect(note.text).to eq 'Ruby Developer'
        end

        it "redirects to the updated character" do
          patch :update, space_id: space, scene_id: scene, id: note, note: attributes_for(:note)
          expect(response).to redirect_to note.notable
        end
      end

      context "with invalid attributes" do
        
        it "does not update the note" do
          patch :update, space_id: space, scene_id: scene, id: note, note: attributes_for(:note, title: '')
          note.reload
          expect(note.title).to eql note.title
        end

        it "should show the flash" do
          post :update, space_id: space, scene_id: scene, id: note, note: attributes_for(:note, title: '')
          expect(flash[:error]).to eq "Note editing fails" 
        end 

        it "re-renders the :edit template" do
          patch :update, space_id: space, scene_id: scene, id: note, note: attributes_for(:note, title: '')
          expect(response).to render_template :edit
        end
      end
    end

    describe "DELETE #destroy" do
      it "deletes a note in database" do
        expect {
          delete :destroy, space_id: space, scene_id: scene, id: note
        }.to change(Note, :count).by(-1)
      end

      it "should have correct redirect" do
        delete :destroy, space_id: space, scene_id: scene, id: note
        expect(response).to redirect_to root_path
      end
    end
  end
end
