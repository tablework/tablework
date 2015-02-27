# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string
#  profile_photo          :string
#  location               :string
#  gender                 :string
#  provider               :string
#  uid                    :string
#  occupation             :string
#  skillset               :string
#  eyecolor               :string
#  DOB                    :date
#  mobile_phone           :string
#  website                :string
#  first_name             :string
#  last_name              :string
#  image                  :string
#  show_intro_1           :boolean          default("true")
#  show_intro_2           :boolean          default("false")
#  show_intro_3           :boolean          default("false")
#

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email+#{n}@email.com" }
    password 'password'
    sequence(:username) { |n| "username_#{n}" }
    gender 'Male'
  end
end
