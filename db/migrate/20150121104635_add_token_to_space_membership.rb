class AddTokenToSpaceMembership < ActiveRecord::Migration
  def change
    add_column :space_memberships, :token, :string
    add_index :space_memberships, :token, unique: true
  end
end
