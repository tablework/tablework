# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  type_of_play :string(255)
#  age          :integer
#  occupation   :string(255)
#  fields       :hstore           default({})
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  nationality  :string(255)
#  DOB          :datetime
#  space_id     :integer
#  gender       :string(255)
#

require 'rails_helper'

RSpec.describe Character, :type => :model do
  let(:character) { build :character }
  subject { character }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :fields }
  it { expect(subject.fields).to eql({}) }
  it { is_expected.to respond_to :occupation }
  it { is_expected.to respond_to :type_of_play }
  it { is_expected.to respond_to :age }
end
