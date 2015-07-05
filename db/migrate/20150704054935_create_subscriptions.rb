class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, index: true
      t.date :expires_on
      t.string :uuid

      t.timestamps null: false
    end
    add_foreign_key :subscriptions, :users
  end
end
