# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  title             :string
#  answer            :string
#  questionable_id   :integer
#  questionable_type :string
#  created_at        :datetime
#  updated_at        :datetime
#

require 'rails_helper'

RSpec.describe Question, :type => :model do
  let(:question) { build :question }
  subject { question }
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :answer }
end
