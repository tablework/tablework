require 'rails_helper'

RSpec.describe Question, :type => :model do
  let(:question) { build :question }
  subject { question }
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :answer }
end
