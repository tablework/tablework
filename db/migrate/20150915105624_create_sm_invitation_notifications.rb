class CreateSmInvitationNotifications < ActiveRecord::Migration
  def change
    create_table :sm_invitation_notifications do |t|
      t.belongs_to :space_membership, index: true

      t.timestamps null: false
    end
    add_foreign_key :sm_invitation_notifications, :space_memberships
  end
end
