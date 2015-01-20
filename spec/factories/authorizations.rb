FactoryGirl.define do
  factory :authorization do
    provider "Facebook"
    uid "MyString"
    user_id "MyString"
    token "MyString"
    secret "MyString"
  end
end
