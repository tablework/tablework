class SpaceMembershipMailer < ActionMailer::Base
  default from: "team@tablework.com"

  def send_invite space_membership
    @confirmation_url = confirm_invite_space_space_memberships_url(space_membership.space.id, space_membership.token)
    mail to: space_membership.email, subject: 'Invitation to join rehearsal space'
  end
end
