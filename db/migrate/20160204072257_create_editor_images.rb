class CreateEditorImages < ActiveRecord::Migration
  def change
    create_table :editor_images do |t|
      t.string :picture

      t.timestamps null: false
    end
  end
end
