class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.string :type_of_play
      t.integer :age
      t.string :occupation
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
