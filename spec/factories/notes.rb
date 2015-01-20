# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  notable_id   :integer
#  notable_type :string(255)
#  text         :text
#  image        :string(255)
#  link         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  link_html    :text
#

FactoryGirl.define do
  factory :note do
    title "MyString"
    notable nil
    notable_type "MyString"
    text "MyText"
    image "MyString"
    link "MyString"
  end

end
