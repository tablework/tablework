require 'rails_helper'

RSpec.describe SceneMembership, :type => :model do
  subject(:membership) { build :scene_membership }

  it { is_expected.to respond_to :scene }
  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :membership_type }
end

