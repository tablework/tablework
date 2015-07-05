# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  expires_on :date
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Subscription, :type => :model do
  let(:user) { create :user }
  subject(:subscription) { build :subscription }

  it { is_expected.to respond_to :user  }
  it { is_expected.to respond_to :expires_on  }
  it { is_expected.to respond_to :uuid  }

  context "associations" do
    it "should belongs_to user" do
      subscription.user = user
      subscription.save
      expect(user.subscription).to eql subscription
    end

    it "should belongs_to subscription_plan" do
      subscription_plan = create :subscription_plan
      subscription.subscription_plan = subscription_plan
      expect(subscription_plan.subscriptions).to be_include subscription
    end
  end
end

