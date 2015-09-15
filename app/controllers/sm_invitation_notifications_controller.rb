class SmInvitationNotificationsController < ApplicationController

  def show
    @sm_invitation_notification = SmInvitationNotification.find(params[:id])
    @space_membership = @sm_invitation_notification.space_membership
  end
end
