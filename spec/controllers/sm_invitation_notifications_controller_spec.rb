require 'rails_helper'

RSpec.describe SmInvitationNotificationsController, :type => :controller do
  let(:user) { create(:user) }

  before do
    @space = create :space
    request.env["HTTP_REFERER"] = space_path(@space)
    sign_in :user, user
  end

  describe "#show" do
    before do
      @invitation = create :sm_invitation_notification
    end

    it "should be a success" do
      get :show, id: @invitation.id
      expect(response).to be_success
    end
    
    it "should have correct invitation" do
      get :show, id: @invitation.id
      expect(assigns(:sm_invitation_notification)).to eql @invitation
    end

    it "should have correct space_membership" do
      get :show, id: @invitation.id
      expect(assigns(:space_membership)).to eql @invitation.space_membership
    end
  end
end
