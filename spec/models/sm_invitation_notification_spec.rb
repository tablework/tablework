require 'rails_helper'

RSpec.describe SmInvitationNotification, :type => :model do
  subject(:sm_invitation_notification) { create :sm_invitation_notification }

  it { is_expected.to respond_to :space_membership }

  describe "Associations" do
    it "should belongs_to space_membership" do
      space_membership = create :space_membership

      expect {
        space_membership.create_sm_invitation_notification
      }.to change(SmInvitationNotification, :count).by 1
    end

    it "should has_one notification" do
      expect {
        subject.create_notification(message: "Invitation to Rehearsal Space")
      }.to change(Notification, :count).by 1
    end
  end
end
