class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :space, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :messages, :spaces
    add_foreign_key :messages, :users
  end
end
