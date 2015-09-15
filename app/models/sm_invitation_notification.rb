class SmInvitationNotification < ActiveRecord::Base
  belongs_to :space_membership
  has_one :notification, as: :notifiable
end
