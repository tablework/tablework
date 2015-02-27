# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :text
#  space_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Message, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
