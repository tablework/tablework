class AddSpaceToCharacters < ActiveRecord::Migration
  def change
    add_reference :characters, :space, index: true
  end
end
