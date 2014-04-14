require 'spec_helper'

describe User do
  context 'logging in' do
    it 'allows users to sign up' do
      create_user_and_sign_in
      page.should have_content "User created!"
    end
    it 'does not allow sign in without username' do
      user = build(:user)
      visit root_path
      click_link "Sign Up"
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Create User"
      page.should have_content "Username can't be blank"
    end
    it 'allows user to log in' do
      user = create(:user)
      visit root_path
      click_link  "Log In"
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Submit"
      page.should have_content "Logged in!"
    end
  end
end
