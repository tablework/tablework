# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)
#  profile_photo          :string(255)
#  location               :string(255)
#  gender                 :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  occupation             :string(255)
#  skillset               :string(255)
#  eyecolor               :string(255)
#  DOB                    :date
#  mobile_phone           :string(255)
#  website                :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  image                  :string(255)
#

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email+#{n}@email.com" }
    password 'password'
    username 'username'
    gender 'Male'
  end
end
