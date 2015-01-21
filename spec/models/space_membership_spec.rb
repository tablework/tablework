require 'rails_helper'

RSpec.describe SpaceMembership, :type => :model do
  subject(:membership) { build :space_membership }

  it { is_expected.to respond_to :space }
  it { is_expected.to respond_to :user }
end
