# == Schema Information
#
# Table name: spaces
#
#  id           :integer          not null, primary key
#  name         :string
#  type_of_play :string
#  description  :string
#  director_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  image        :string
#

FactoryGirl.define do
  factory :space do
    name "MyString"
    type_of_play "MyString"
    description "MyString"
    director { create :user, :director }
  end
end
