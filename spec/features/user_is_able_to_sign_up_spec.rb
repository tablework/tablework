require 'rails_helper'

feature "user should see sign up page" do
  scenario "see sign up link on root page" do
    go_to_sign_up_page
    expect(page).to have_selector('h3', text: 'Sign up')
  end

  scenario "successfully signed up" do
    go_to_sign_up_page
    fill_in('user_email', with: "abc@abc.com")
    fill_in('user_password', with: "password")
    fill_in('user_password_confirmation', with: "password")
    click_button('Sign up')
    expect(page).to have_selector('body', text: 'Welcome! You have signed up successfully.')
  end

end

def go_to_sign_up_page
  visit root_path
  click_button('Sign up')
end
