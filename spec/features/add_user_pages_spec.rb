require 'rails_helper'

describe "the create user process" do
  it "has a link to 'create an account' on the homepage" do
    visit root_path
    expect(page).to have_content "Create an Account"
  end




end
