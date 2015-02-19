class SpaceMembershipMailer < ActionMailer::Base
  default from: "team@tablework.com"

  def send_invite space_membership
    @confirmation_url = confirm_invite_space_space_memberships_url(space_membership.space.id, space_membership.token)
    @space_membership = space_membership
    mail to: space_membership.email, subject: "Invitation to rehearse at #{@space_membership.space.name}"
  end
end
