# == Schema Information
#
# Table name: scenes
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  scenable_id   :integer
#  scenable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

RSpec.describe Scene, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
