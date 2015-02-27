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

class SceneMembership < ActiveRecord::Base
  belongs_to :scene
  belongs_to :character
end
