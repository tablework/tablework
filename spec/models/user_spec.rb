require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:object) { build :user }
  subject { object }
  it { is_expected.to respond_to :username }
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }
  it { is_expected.to respond_to :profile_photo }
  it { is_expected.to respond_to :location }
  it { is_expected.to respond_to :gender }
end
