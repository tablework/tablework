class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :title
      t.belongs_to :scenable, index: true
      t.string :scenable_type

      t.timestamps
    end
  end
end
