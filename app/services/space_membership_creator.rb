class SpaceMembershipCreator
  def initialize space_membership
    @space_membership = space_membership
  end
  
  def call
    if @space_membership.save
      SpaceMembershipMailer.send_invite(@space_membership).deliver_now
      @validity = true
    else
      @validity = false
    end
    sm_invitation_notification = SmInvitationNotification.find_or_create_by(space_membership_id: @space_membership.id)
    Notification.find_or_create_by(notifiable: sm_invitation_notification, message: 'Invitation to Rehearsal Space')
    return @validity
  end
end
