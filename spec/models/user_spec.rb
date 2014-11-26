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
