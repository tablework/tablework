FactoryGirl.define do
  factory :user_payment do
    user_id "4"
		plantype "Subscription"
		payment_type "CreditCard"
		payment_id "h1234"
  end

end
