require 'rails_helper'

describe "the create user process" do
  it "has a link to 'create an account' on the homepage" do
    visit root_path
    expect(page).to have_content "Create an Account"
  end

  it "displays the form when you click on 'create an account'" do
    visit root_path
    click_on "Create an Account"
    expect(page).to have_content "Password confirmation"
  end

  it "throws an error if your password confirmation is wrong" do
    visit new_user_path
    fill_in "Name", :with => "Ryan"
    fill_in "Phone", :with => "15005550006"
    fill_in "Password", :with => "test"
    fill_in "Password confirmation", :with => "nottest"
    click_on "Create User"
    expect(page).to have_content "Password confirmation"
  end

  it "throws an error if your name is already taken" do
    FactoryGirl.create(:user)
    visit new_user_path
    fill_in "Name", :with => "Ryan"
    fill_in "Phone", :with => "15005550006"
    fill_in "Password", :with => "test"
    fill_in "Password confirmation", :with => "test"
    click_on "Create User"
    expect(page).to have_content "Password confirmation"
  end

  it "works if you do everything right" do
    visit new_user_path
    fill_in "Name", :with => "RyanTMcCarthy"
    fill_in "Phone", :with => "15005550006"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_on "Create User"
    expect(page).to have_content "Plers lergern:"
  end

end
