require "rails_helper"

RSpec.describe SpaceMembershipMailer, :type => :mailer do
  describe 'send_invite' do
    let!(:space_membership) { create :space_membership }
    let!(:mail) { SpaceMembershipMailer.send_invite(space_membership) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Invitation to join rehearsal space')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([space_membership.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['team@tablework.com'])
    end

    it 'assigns @token' do
      expect(mail.body.encoded).to match(space_membership.token)
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("space_memberships/#{space_membership.id}/invitation_confirmation/#{space_membership.token}")
    end
  end
end
