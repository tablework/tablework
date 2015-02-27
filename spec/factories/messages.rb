# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :text
#  space_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :message do
    text "MyText"
space nil
user nil
  end

end
