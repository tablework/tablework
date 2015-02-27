# == Schema Information
#
# Table name: user_payments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  payment_type :string
#  plantype     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  payment_id   :string
#  status       :string
#

require 'rails_helper'

RSpec.describe UserPayment, :type => :model do
  let!(:user_payment) { create(:user_payment ) }
	it { should belong_to(:user) }

end
