class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.belongs_to :notable, index: true
      t.string :notable_type
      t.text :text
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
