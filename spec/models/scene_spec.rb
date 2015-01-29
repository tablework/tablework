# == Schema Information
#
# Table name: scenes
#
#  id            :integer          not null, primary key
#  title         :string
#  scenable_id   :integer
#  scenable_type :string
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

RSpec.describe Scene, :type => :model do
end
