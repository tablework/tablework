class AddNotifiableToNotifications < ActiveRecord::Migration
  def change
    add_reference :notifications, :notifiable, polymorphic: true, index: true
  end
end
