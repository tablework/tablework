require 'rails_helper'

RSpec.describe Character, :type => :model do
  let(:character) { build :character }
  subject { character }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :fields }
  it { expect(subject.fields).to eql({}) }
  it { is_expected.to respond_to :occupation }
  it { is_expected.to respond_to :type }
  it { is_expected.to respond_to :age }
end
