# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :integer
#  token      :string(255)
#  secret     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  username   :string(255)
#

FactoryGirl.define do
  factory :authorization do
    provider "Facebook"
    uid "MyString"
    user_id "MyString"
    token "MyString"
    secret "MyString"
  end
end
