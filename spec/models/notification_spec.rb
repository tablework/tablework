require 'rails_helper'

RSpec.describe Notification, :type => :model do
  subject(:notificaion) { create :notification }

  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :message }
  it { is_expected.to respond_to :unread }

  context 'Association' do
    it 'should belongs to user' do
      expect {
        user = create :user
        user.notifications.create(message: 'New Notifications')
      }.to change(Notification, :count).by(1)
    end
  end
end
