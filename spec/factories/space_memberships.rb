FactoryGirl.define do
  factory :space_membership do
    space
    user
    sequence(:email) { |n| "email-#{n}@email.com"}
  end
end
