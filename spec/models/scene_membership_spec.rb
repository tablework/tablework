# == Schema Information
#
# Table name: scene_memberships
#
#  id              :integer          not null, primary key
#  scene_id        :integer
#  user_id         :integer
#  membership_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  character_id    :integer
#

require 'rails_helper'

RSpec.describe SceneMembership, :type => :model do
  subject(:membership) { build :scene_membership }

  it { is_expected.to respond_to :scene }
  it { is_expected.to respond_to :membership_type }
end

