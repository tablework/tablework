class CreateSpaceMemberships < ActiveRecord::Migration
  def change
    create_table :space_memberships do |t|
      t.belongs_to :space, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
