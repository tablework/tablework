require 'rails_helper'

feature "user should see log in page" do
	let(:user) {create(:user)}

	scenario "go to root page" do
    visit root_path
    expect(page).to have_selector('h3', text: 'Sign in')
	end

	scenario 'successfully logged in' do
		visit root_path
		fill_in('user_email', with: user.email)
		fill_in('user_password', with: user.password)
		click_button('Sign in')
		expect(page).to have_content('Signed in successfully')
	end
end
