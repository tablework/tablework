require 'rails_helper'

RSpec.describe UserPayment, :type => :model do
  let!(:user_payment) { create(:user_payment ) }
	it { should belong_to(:user) }

	
end
