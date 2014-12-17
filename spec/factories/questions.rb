# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  answer            :string(255)
#  questionable_id   :integer
#  questionable_type :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

FactoryGirl.define do
  factory :question do
    title "MyString"
	answer "MyString"
  end

end
