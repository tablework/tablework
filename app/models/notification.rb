class Notification < ActiveRecord::Base
  scope :unread, -> { where(unread: true) }
  belongs_to :user
  belongs_to :notifiable, polymorphic: true
end
