class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :type_of_play
      t.string :description
      t.belongs_to :director, index: true

      t.timestamps
    end
  end
end
