class AddColumnsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :nationality, :string
    add_column :characters, :DOB, :datetime
  end
end
