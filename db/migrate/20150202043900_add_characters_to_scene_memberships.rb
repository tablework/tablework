class AddCharactersToSceneMemberships < ActiveRecord::Migration
  def change
    add_reference :scene_memberships, :character, index: true
    add_foreign_key :scene_memberships, :characters
  end
end
