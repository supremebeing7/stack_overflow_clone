def create_user_and_sign_in
  user = build(:user)
  visit root_path
  click_link "Sign Up"
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  click_button "Create User"
end
