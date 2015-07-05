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

FactoryGirl.define do
  factory :subscription_plan do
    character_limit 2
    owned_space false
    name "Free"
    state "active"
  end

end
