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

FactoryGirl.define do
  factory :scene_membership do
    scene
    character
    membership_type "MyString"
  end

end
