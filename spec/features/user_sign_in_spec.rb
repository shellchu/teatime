require 'rails_helper'

feature "User signs in" do
  given(:user) {Fabricate(:user) }

  scenario "with vaild user name and password" do
    sign_in(user)
    expect(page).to have_content user.full_name
  end

  scenario "with vaild user name, but wrong password" do
    visit sign_in_path
    fill_in "Email address", with: user.email
    fill_in "Password", with: "hehe"
    click_on "Sign in"
    expect(current_path).to eq(sign_in_path)
    expect(page).to have_content "Invaild email or password"
  end
end
