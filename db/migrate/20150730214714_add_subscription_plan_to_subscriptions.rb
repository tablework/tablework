class AddSubscriptionPlanToSubscriptions < ActiveRecord::Migration
  def change
    add_reference :subscriptions, :subscription_plan, index: true
    add_foreign_key :subscriptions, :subscription_plans
  end
end
