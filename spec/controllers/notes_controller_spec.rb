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

        # it "should have correct redirect" do
        #   post :create, space_id: space, scene_id: scene, note: attributes_for(:note)
        #   expect(response).to redirect_to root_path(character: note.id)
        # end
      end

      context "without valid attributes" do
        it "does not save the new note into database" do
          expect {
            post :create, space_id: space, scene_id: scene, note: attributes_for(:note) 
          }.to_not change(Character, :count)
        end  

        # it "should render :new" do
        #   post :create, note: { title: '' }
        #   expect(response).to render_template 'characters/new'
        # end
      end
    end
  end
end
