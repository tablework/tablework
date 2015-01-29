# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  title             :string
#  answer            :string
#  questionable_id   :integer
#  questionable_type :string
#  created_at        :datetime
#  updated_at        :datetime
#

FactoryGirl.define do
  factory :question do
    title "MyString"
	answer "MyString"
  end

end
