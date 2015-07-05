class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.integer :character_limit
      t.boolean :owned_space, default: false
      t.string :name
      t.string :state

      t.timestamps null: false
    end
  end
end
