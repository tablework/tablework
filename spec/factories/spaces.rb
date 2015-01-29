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
#

FactoryGirl.define do
  factory :space do
    name "MyString"
type_of_play "MyString"
description "MyString"
director nil
  end

end
