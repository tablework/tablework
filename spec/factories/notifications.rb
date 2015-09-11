FactoryGirl.define do
  factory :notification do
    user
    message "MyText"
    unread false
  end
end
