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
  context 'asking questions' do
    it 'allows a user to submit a question' do
      ask_a_question
      page.should have_content "Question added!"
    end
  end
  context 'answering questions' do
    it 'should allow a user to answer a question', js: true do
      ask_a_question
      click_link @title
      click_link "Answer this Question"
      fill_in "Content", with: "YEEEeeeeeeaaaahahaherhfbrjegbfkjwebgkblasfdbsafkebngklv;web gklvw lfj ewkl;fgewkl g;lwe her'g;erw"
      click_button "Submit"
    end
  end
end
