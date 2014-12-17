require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  subject(:user) { create(:user) }

  before do
    sign_in :user, user
  end

  describe "#update" do
    it "should update the user information" do
      put :update, id: user.id, user: valid_user_params
      expect(assigns[:user].first_name).to eql 'Debra'
      expect(assigns[:user].last_name).to eql 'Moore'
      expect(assigns[:user].DOB).to eql Date.today - 20.year
      expect(assigns[:user].gender).to eql 'female'
      expect(assigns[:user].occupation).to eql 'Actor'
      expect(assigns[:user].location).to eql 'Kuala Lumpur'
    end
  end

  def valid_user_params
    {
      first_name: 'Debra', last_name: 'Moore', DOB: Date.today - 20.year,
      gender: 'female', occupation: 'Actor', location: 'Kuala Lumpur'
    }
  end
end
