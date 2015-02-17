FactoryGirl.define do
  factory :user_payment do
    association :user
		plantype "Subscription"
		payment_type "CreditCard"
		payment_id "h1234"
  end

end
