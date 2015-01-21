class SpaceMembershipMailer < ActionMailer::Base
  default from: "team@tablework.com"

  def send_invite space_membership
    mail to: space_membership.email, subject: 'Invitation to join rehearsal space'
    @token = space_membership.token
    @confirmation_url = "/space_memberships/#{space_membership.id}/invitation_confirmation/#{space_membership.token}"
    render json: {
      token: @token,
      confirmation_url: @confirmation_url
    }
  end
end
