class AddEmailToSpaceMemberships < ActiveRecord::Migration
  def change
    add_column :space_memberships, :email, :string
    add_index :space_memberships, :email
  end
end
