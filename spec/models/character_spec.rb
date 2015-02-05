# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  type_of_play :string
#  age          :integer
#  occupation   :string
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  nationality  :string
#  DOB          :datetime
#  space_id     :integer
#  gender       :string
#  image        :string
#

require 'rails_helper'

RSpec.describe Character, :type => :model do
  let(:character) { build :character }
  subject { character }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :occupation }
  it { is_expected.to respond_to :type_of_play }
  it { is_expected.to respond_to :age }
  it { is_expected.to respond_to :notes }

  describe 'validation' do
    describe 'name' do
      it "should should not be valid" do
        character.name = ''
        expect(character).not_to be_valid
      end
    end
  end
end
