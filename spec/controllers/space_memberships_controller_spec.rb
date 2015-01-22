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
      get :new, space_id: @space.id
      expect(response).to be_success
    end

    it "should have correct assigns" do
      get :new, space_id: @space.id
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

    it "should redirect to space" do
      post :create, space_id: @space.id, space_membership: { email: 'new@email.com' }
      expect(response).to redirect_to space_path(@space)
    end

    it "should have correct flash" do
      post :create, space_id: @space.id, space_membership: { email: 'new@email.com' }
      expect(flash[:notice]).to eql 'Invitation sent'
    end
  end

  describe 'GET #confirm' do
    before do
      @user = create :user, email: 'new_user@email.com'
      @space_membership = create :space_membership, email: @user.email, space: @space
    end

    it "should add user to space membership" do
      user = create :user
      sign_in :user, user
      get :confirm, space_id: @space.id, token: @space_membership.token
      expect(@space_membership.reload.user).to eql User.find_by(email: user.email)
    end

    it "should redirect to space" do
      get :confirm, space_id: @space.id, token: @space_membership.token
      expect(response).to redirect_to space_path(@space)
    end
  end
end
