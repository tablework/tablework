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

FactoryGirl.define do
  factory :character do
    name "MyString"
    description "MyText"
    type_of_play "MyString"
    age 1
    occupation "MyString"
    fields "{}"
    user nil
  end

end
