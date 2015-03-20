require 'rails_helper'

describe "The create post process" do
  it "routes to the new post page correctly" do
    visit root_path
    click_on "Create a new post"
    expect(page).to have_content "New Post"
  end



end
