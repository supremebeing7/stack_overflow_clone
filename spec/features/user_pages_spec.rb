require 'spec_helper'

describe User do
  context 'logging in' do
    it 'allows users to sign up' do
      user = build(:user)
      visit root_path
      click_link "Sign Up"
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Create User"
      page.should have_content "User created!"
    end
  end
end
