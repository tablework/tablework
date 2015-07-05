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

require 'rails_helper'

RSpec.describe User, :type => :model do
  subject(:user) { build :user }

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
      it "using invalid gender" do
        ['invalid', 'Gender'].each do |invalid|
          subject.gender = invalid
          expect(subject).not_to be_valid
        end
      end
    end
  end

  describe 'associations' do
    before do
      user.save
    end

    it "has many characters" do
      character = create :character
      user.characters << character
      expect(user.characters.order(:id).to_a.last).to eql character
    end

    it "has many authorizations", vcr: {cassette_name: 'facebook', match_requests_on: [:host, :path], record: :once} do
      authorization = create :authorization
      user.authorizations << authorization
      expect(user.authorizations.to_a).to eql [authorization]
    end

    it "has many owned spaces" do
      space = create :space
      user.owned_spaces << space
      expect(user.owned_spaces.to_a.last).to eql space
    end

    it "has many space memberships" do
      space_membership = create :space_membership
      user.space_memberships << space_membership
      expect(user.space_memberships.to_a).to eql [space_membership]
    end

    it "has many spaces through space memberships" do
      space = create :space
      space_membership = create :space_membership, space: space, user: user
      expect(user.spaces.to_a).to eql [space]
    end

    it "has one subscription" do
     subscription 
    end
  end
end
