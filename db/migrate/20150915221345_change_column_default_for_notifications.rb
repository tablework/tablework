class ChangeColumnDefaultForNotifications < ActiveRecord::Migration
  def change
    change_column_default :notifications, :unread, true
  end
end
