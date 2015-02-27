# == Schema Information
#
# Table name: scenes
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  scenable_id   :integer
#  scenable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Scene < ActiveRecord::Base
  belongs_to :scenable, polymorphic: true
  has_many :scene_memberships, dependent: :destroy
  has_many :characters, through: :scene_memberships
  has_many :notes, as: :notable, dependent: :destroy
end
