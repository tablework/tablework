class SpaceMembershipCreator
  def initialize space_membership
    @space_membership = space_membership
  end
  
  def call
    if @space_membership.new_record?
      @space_membership.save
      SpaceMembershipMailer.send_invite(@space_membership).deliver_now
    end
    sm_invitation_notification = SmInvitationNotification.find_or_create_by(space_membership_id: @space_membership.id)
    user = User.find_by(email: @space_membership.email)
    Notification.find_or_create_by(notifiable: sm_invitation_notification, message: "Invitation to Rehearsal Space(#{@space_membership.space.name})", user: user)
  end
end
