require 'rails_helper'

feature "UserCanEditProfiles", :type => :feature, vcr: {cassette_name: 'facebook', match_requests_on: [:host, :path], record: :once} do
  before do
    @test_users = Koala::Facebook::TestUsers.new(:app_id => ENV['FACEBOOK_APP_ID'], :secret => ENV['FACEBOOK_APP_SECRET'])
    user = @test_users.create(true, [])
    @user = create :user
    auth = create :authorization, token: user['access_token']
    @user.authorizations << auth
  end
  scenario 'can edit' do
    sign_in @user
    click_link 'EDIT PROFILE'
    fill_in 'First name', with: 'Debra'
    fill_in 'Last name', with: 'Moore'
    select '6', from: 'user[DOB(3i)]'
    select 'August', from: 'user[DOB(2i)]'
    select '1988', from: 'user[DOB(1i)]'
    select 'female', from: 'Gender'
    fill_in 'Occupation', with: 'Actor'
    fill_in 'Location', with: 'Kuala Lumpur'
    click_button 'Edit'
    expect(@user.reload.first_name).to eql 'Debra'
    expect(@user.reload.last_name).to eql 'Moore'
    expect(@user.reload.DOB).to eql '6 August 1988'.to_date
    expect(@user.reload.gender).to eql 'female'
    expect(@user.reload.occupation).to eql 'Actor'
    expect(@user.reload.location).to eql 'Kuala Lumpur'
  end
end
