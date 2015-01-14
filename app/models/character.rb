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
#  space_id     :integer
#  gender       :string(255)
#

class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  before_validation { self.gender.downcase! if self.gender }
  has_many :notes, :as => :notable
end
