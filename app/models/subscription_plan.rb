# == Schema Information
#
# Table name: subscription_plans
#
#  id              :integer          not null, primary key
#  character_limit :integer
#  owned_space     :boolean          default("false")
#  name            :string
#  state           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class SubscriptionPlan < ActiveRecord::Base
end
