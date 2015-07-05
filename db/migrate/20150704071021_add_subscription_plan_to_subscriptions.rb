class AddSubscriptionPlanToSubscriptions < ActiveRecord::Migration
  def change
    add_reference :subscriptions, :subscription, index: true
    add_foreign_key :subscriptions, :subscriptions
  end
end
