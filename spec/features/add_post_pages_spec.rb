require 'rails_helper'

describe "The create post process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "routes to the new post page correctly" do
    visit posts_path
    click_on "Create a new post"
    expect(page).to have_content "New Post"
  end

  it "displays the form" do
    visit posts_path
    click_on "Create a new post"
    expect(page).to have_content "Title"
  end

  it "creates a new post using the form" do
    visit posts_path
    click_on "Create a new post"
    fill_in "Title", :with => "Hi"
    fill_in "Text", :with => "hello"
    click_on "Create Post"
    expect(page).to have_content "Hi"
  end

  it "validates text" do
    visit posts_path
    click_on "Create a new post"
    fill_in "Title", :with => "Hi"
    click_on "Create Post"
    expect(page).to have_content "Oops"
  end



end
