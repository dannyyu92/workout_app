require 'spec_helper'

feature "Signing in" do
  before do 
    visit new_user_session_path
  end

  scenario "User signs in through email" do
    user = FactoryGirl.create(:user)
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign In"

    current_path.should eq(user_exercises_path(user.id))
    expect(page).to have_content /.*(Signed in successfully).*/
  end
end