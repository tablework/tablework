FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email+#{n}@email.com" }
    password 'password'
    username 'username'
    gender 'Male'
  end
end
