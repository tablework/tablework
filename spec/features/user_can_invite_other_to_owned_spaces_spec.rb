require 'rails_helper'

feature "UserCanInviteOtherToOwnedSpaces", :type => :feature, vcr: {cassette_name: 'facebook', match_requests_on: [:host, :path], record: :once} do
  before do
    @test_users = Koala::Facebook::TestUsers.new(:app_id => ENV['FACEBOOK_APP_ID'], :secret => ENV['FACEBOOK_APP_SECRET'])
    user = @test_users.create(true, [])
    @user = create :user
    auth = create :authorization, token: user['access_token']
    @user.authorizations << auth
    @owned_space = create :space
    @user.owned_spaces << @owned_space
  end
  scenario 'can invite user' do
    sign_in @user
    visit space_path(@owned_space)
    find('#add-cast').click
    find('.form-inputs').fill_in('Email', with: 'new@email.com')
    find('.form-actions').click_button('INVITE')
    expect(ActionMailer::Base.deliveries.first.to).to eql ['new@email.com']
  end
end
