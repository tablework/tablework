require 'rails_helper'

RSpec.describe SpaceMembershipsController, :type => :controller do
  let(:user) { create(:user) }

  before do
    @space = create :space
    request.env["HTTP_REFERER"] = space_path(@space)
    sign_in :user, user
  end

  describe 'GET #new' do
    it "should be success" do
      get :new
      expect(response).to be_success
    end

    it "should have correct assigns" do
      get :new
      expect(assigns[:space_membership]).to be_instance_of(SpaceMembership)
      expect(assigns[:space_membership]).to be_new_record
    end
  end

  describe "POST #create" do
    it "should create new space membership" do
      expect{
        post :create, space_id: @space.id, space_membership: { email: 'new@email.com' }
      }.to change(SpaceMembership, :count).by 1
    end

    it "should send email to space member" do
      post :create, space_id: @space.id, space_membership: { email: 'new@email.com' }
      expect(ActionMailer::Base.deliveries.last.to).to eql ['new@email.com']
    end
  end
end
