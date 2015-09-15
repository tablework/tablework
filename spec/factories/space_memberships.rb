# == Schema Information
#
# Table name: space_memberships
#
#  id         :integer          not null, primary key
#  space_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  email      :string
#  token      :string
#

FactoryGirl.define do
  factory :space_membership do
    sequence(:email) { |n| "email-#{n}@email.com"}
    space
    user
  end
end
