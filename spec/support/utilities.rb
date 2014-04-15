def create_user_and_sign_in
  user = build(:user)
  visit root_path
  click_link "Sign Up"
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  click_button "Create User"
end

def ask_a_question
  question = build :question
  create_user_and_sign_in
  visit new_question_path
  fill_in "Title", with: question.title
  @title = question.title
  fill_in "Content", with: question.content
  click_button "Create Question"
end
