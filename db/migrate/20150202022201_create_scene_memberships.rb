class CreateSceneMemberships < ActiveRecord::Migration
  def change
    create_table :scene_memberships do |t|
      t.belongs_to :scene, index: true
      t.belongs_to :user, index: true
      t.string :membership_type

      t.timestamps null: false
    end
    add_foreign_key :scene_memberships, :scenes
    add_foreign_key :scene_memberships, :users
  end
end
