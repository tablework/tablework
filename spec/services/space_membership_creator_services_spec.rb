require "rails_helper"

RSpec.describe SpaceMembershipCreator, :type => :service do
  let(:space_membership) { build :space_membership }
  subject(:creator) { SpaceMembershipCreator.new(space_membership) }

  describe "#call" do
    context "without valid space_membership" do
      it "should return false" do
        existing_space_membership = create :space_membership, email: space_membership.email
        expect(subject.call).to eq false
      end
    end

    context "with valid space_membership" do
      it "should return true" do
        expect(subject.call).to eql true
      end

      it "should deliver email" do
        subject.call
        expect(ActionMailer::Base.deliveries.last.to).to eql space_membership.email
      end
    end

    it "should create SmInvitationNotification" do
      expect{subject.call}.to change(SmInvitationNotification, :count).by 1
    end

    it "should create notification" do
      expect{subject.call}.to change(Notification, :count).by 1
    end
  end
end
