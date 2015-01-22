require 'rails_helper'

RSpec.describe SpaceMembership, :type => :model do
  subject(:membership) { build :space_membership }

  it { is_expected.to respond_to :space }
  it { is_expected.to respond_to :user }

  describe "callbacks" do
    describe "before_validation" do
      it "should have token" do
        membership.valid?
        expect(membership).not_to be_nil
      end
    end
  end

  describe 'validations' do
    it "should have unique email" do
      membership.save
      new_membership = membership.dup
      expect(new_membership).not_to be_valid
    end
  end

  describe "#send_invite" do
    it "should send invite" do
      subject.save
      expect{
        subject.send_invite
      }.to change(ActionMailer::Base.deliveries, :count).by(1)
    end
  end
end
