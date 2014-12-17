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
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:object) { build :user }
  subject { object }

  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }
  it { is_expected.to respond_to :username }
  it { is_expected.to respond_to :profile_photo }
  it { is_expected.to respond_to :location }
  it { is_expected.to respond_to :gender }
  it { is_expected.to respond_to :occupation }
  it { is_expected.to respond_to :skillset }
  it { is_expected.to respond_to :eyecolor }
  it { is_expected.to respond_to :DOB }
  it { is_expected.to respond_to :mobile_phone }
  it { is_expected.to respond_to :website }
  it { is_expected.to respond_to :first_name }
  it { is_expected.to respond_to :last_name }

  describe 'validations' do
    context 'invalid' do
      it "username not unique" do
        new_user = create :user, username: 'Name'
        subject.username = 'Name'
        expect(subject).not_to be_valid
      end

      it "using invalid gender" do
        ['invalid', 'Gender'].each do |invalid|
          subject.gender = invalid
          expect(subject).not_to be_valid
        end
      end
    end
  end
end
