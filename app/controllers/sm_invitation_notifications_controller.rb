class SmInvitationNotificationsController < ApplicationController

  def show
    @sm_invitation_notification = SmInvitationNotification.find(params[:id])
    @space_membership = @sm_invitation_notification.space_membership
    if @space_membership.user == current_user
      redirect_to :back, notice: "You have already accepted the invitation"
    else
      @sm_invitation_notification.notification.update(unread: false)
    end
  end
end
