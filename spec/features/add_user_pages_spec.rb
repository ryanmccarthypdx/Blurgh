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




end
