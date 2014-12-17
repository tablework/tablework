# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  type_of_play :string(255)
#  age          :integer
#  occupation   :string(255)
#  fields       :hstore           default({})
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  nationality  :string(255)
#  DOB          :datetime
#

class Character < ActiveRecord::Base
  belongs_to :user
  # has_many :questions, :as => :questionable
end
