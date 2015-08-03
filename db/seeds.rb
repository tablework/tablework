if SubscriptionPlan.all.empty?
  SubscriptionPlan.create(name: 'Free', owned_space: false, character_limit: 3, state: 'active')
  SubscriptionPlan.create(name: 'Pro', owned_space: true, character_limit: 1_000_000, state: 'active')
end
