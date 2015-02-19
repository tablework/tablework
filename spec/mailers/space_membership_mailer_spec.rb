require "rails_helper"

RSpec.describe SpaceMembershipMailer, :type => :mailer do
  describe 'send_invite' do
    let(:space) { create :space }
    let!(:space_membership) { create :space_membership, space: space }
    let!(:mail) { SpaceMembershipMailer.send_invite(space_membership) }

    it 'renders the subject' do
      expect(mail.subject).to eql("Invitation to rehearse at #{space.name}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([space_membership.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['team@tablework.com'])
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("spaces/#{space_membership.space.id}/space_memberships/confirm/#{space_membership.token}")
    end
  end
end
