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



end
