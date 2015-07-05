# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  expires_on :date
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :subscription do
    user
    subscription_plan
    expires_on 1.month.from_now
    uuid "MyString"
  end
end
