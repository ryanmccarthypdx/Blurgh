require 'rails_helper'

describe "the login and logout process" do
  it "doesn't log in if your password is wrong" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Name", :with => "Ryan"
    fill_in "Password", :with => "nottest"
    click_on "Log in"
    expect(page).to have_content "Something went wrong!"
  end

  it "doesn't log in if your user name is wrong" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Name", :with => "Tim"
    fill_in "Password", :with => "test"
    click_on "Log in"
    expect(page).to have_content "Something went wrong!"
  end

  it "logs in if you name and password are correct" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Name", :with => "Ryan"
    fill_in "Password", :with => "test"
    click_on "Log in"
    expect(page).to have_content "Login successful!"
  end

  it "doesn't display the 'Log out' or 'you are logged in' info if not logged in" do
    FactoryGirl.create(:user)
    visit root_path
    expect(page).to have_no_content "You are logged in as:"
    expect(page).to have_no_content "Log out"
  end

  it "displays username and log out option if you are logged in" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Name", :with => "Ryan"
    fill_in "Password", :with => "test"
    click_on "Log in"
    expect(page).to have_content "You are logged in as: Ryan"
    expect(page).to have_content "Log out"
  end

  it "logs out correctly" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Name", :with => "Ryan"
    fill_in "Password", :with => "test"
    click_on "Log in"
    click_on "Log out"
    expect(page).to have_no_content "Ryan"
  end



end
