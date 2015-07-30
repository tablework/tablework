# == Schema Information
#
# Table name: subscriptions
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  expires_on           :date
#  uuid                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  subscription_id      :integer
#  subscription_plan_id :integer
#

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription_plan

  def premium?
    self.subscription_plan_id == 2
  end
end
