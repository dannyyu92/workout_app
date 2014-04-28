require 'spec_helper'

feature "Tracker management" do
  background do 
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign In"

    current_path.should eq(user_exercises_path(user.id))

    select "Arms", from: "exercise_muscle_group"
    fill_in "sets-text", with: "4"
    fill_in "reps-text", with: "8"
    fill_in "weight-text", with: "1337"
    fill_in "exercise-text", with: "Tricep Extensions"
  end

  scenario "User correctly adds an exercise" do
    click_button "Submit"
    
    expect(page).to have_content /.*(Exercise successfully created).*(Tricep Extensions).*(Sets: 4).*(Reps: 8).*(Weight: 1337.0 lbs).*/
  end

  scenario "User deletes an exercise" do
    click_button "Submit"
    click_link "Tricep Extensions-delete"
    
    expect(page).to have_content /.*(Exercise successfully deleted).*/
  end

  scenario "User edits an exercise" do
    click_button "Submit"
    click_link "Tricep Extensions-edit"
    fill_in "exercise_name", with: "Changed Name"
    click_button "Submit"

    expect(page).to have_content /.*(Exercise successfully updated).*(Changed Name).*/
  end
end