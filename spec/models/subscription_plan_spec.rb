# == Schema Information
#
# Table name: subscription_plans
#
#  id              :integer          not null, primary key
#  character_limit :integer
#  owned_space     :boolean          default("false")
#  name            :string
#  state           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe SubscriptionPlan, :type => :model do

  subject(:subscription_plan) { build :subscription_plan }

  it { is_expected.to respond_to :character_limit  }
  it { is_expected.to respond_to :owned_space  }
  it { is_expected.to respond_to :name  }
  it { is_expected.to respond_to :state }

end
