# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  type_of_play :string
#  age          :integer
#  occupation   :string
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  nationality  :string
#  DOB          :datetime
#  space_id     :integer
#  gender       :string
#  image        :string
#

FactoryGirl.define do
  factory :character do
    name "MyString"
    description "MyText"
    type_of_play "MyString"
    age 1
    occupation "MyString"
    user nil
  end

end
