# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  user_id    :integer
#  token      :string
#  secret     :string
#  created_at :datetime
#  updated_at :datetime
#  username   :string
#

require 'rails_helper'

RSpec.describe Authorization, :type => :model do
end
