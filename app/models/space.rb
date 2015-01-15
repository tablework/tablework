# == Schema Information
#
# Table name: spaces
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  type_of_play :string(255)
#  description  :string(255)
#  director_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Space < ActiveRecord::Base
  has_many :characters
  has_many :scenes, as: :scenable
  belongs_to :director, class: User
end
