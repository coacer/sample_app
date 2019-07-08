require 'rails_helper'

RSpec.feature "UsersSignups", type: :feature do

  feature "valid signup information" do
    before do
      visit signup_path
      fill_in "Name", with: "Example User"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirmation", with: "password"
    end

    scenario "add users count" do
      expect {
        click_button "Create my account"
        expect(page).to have_current_path user_path(User.last)
      }.to change(User, :count).by(1)
    end

    scenario "is show flash message" do
      click_button "Create my account"
      expect(page).to have_content "Welcome to the Sample App!"
      visit current_path
      expect(page).to_not have_content "Welcome to the Sample App!"
    end
  end

  feature "invalid signup information" do
    before do
      visit signup_path
      fill_in "Name", with: ""
      fill_in "Email", with: "user@invalid"
      fill_in "Password", with: "foo"
      fill_in "Confirmation", with: "bar"
    end

    scenario "no difference users count" do
      expect {
        click_button "Create my account"
        expect(page).to have_current_path signup_path
      }.to_not change(User, :count)
    end

    scenario "is show error messages" do
      click_button "Create my account"
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Email is invalid"
      expect(page).to have_content "Password is too short"
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end
