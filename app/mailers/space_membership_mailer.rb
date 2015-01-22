class SpaceMembershipMailer < ActionMailer::Base
  default from: "team@tablework.com"

  def send_invite space_membership
    @token = space_membership.token
    @confirmation_url = "#{root_url}space_memberships/#{space_membership.id}/invitation_confirmation/#{space_membership.token}"
    mail to: space_membership.email, subject: 'Invitation to join rehearsal space'
  end
end
