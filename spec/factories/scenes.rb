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

FactoryGirl.define do
  factory :scene do
    title "MyString"
scenable nil
scenable_type "MyString"
  end

end
