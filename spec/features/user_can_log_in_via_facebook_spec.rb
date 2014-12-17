require 'rails_helper'

feature "user should see facebook log in link" do
  let(:user) {create(:user)}

  scenario "see facebook login link on root page" do
    visit root_path
    expect(page).to have_link('Sign in with Facebook', href: '/users/auth/facebook')
  end

end
