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

class UserPayment < ActiveRecord::Base
	belongs_to :user
end
