FactoryGirl.define do
  factory :space_membership do
    sequence(:email) { |n| "email-#{n}@email.com"}
    space nil
    user nil
  end
end
