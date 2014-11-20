FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email+#{n}{Time.now}@email.com" }
    password 'password'
    username 'username'
    gender 'Male'
  end
end
