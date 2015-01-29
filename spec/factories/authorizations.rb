# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  user_id    :integer
#  token      :string
#  secret     :string
#  created_at :datetime
#  updated_at :datetime
#  username   :string
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
