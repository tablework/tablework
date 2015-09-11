class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.text :message
      t.boolean :unread, default: false

      t.timestamps null: false
    end
    add_foreign_key :notifications, :users
  end
end
