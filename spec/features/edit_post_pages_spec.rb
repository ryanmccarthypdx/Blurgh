require 'rails_helper'

describe "the edit post process" do
  it "brings up a prepopulated form when the edit button is clicked on the homepage" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad")
    visit posts_path
    click_on "Edit"
    expect(page).to have_content "chicken salad" && "Text"
  end
  it "makes changes when the form is submitted" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad")
    visit posts_path
    click_on "Edit"
    fill_in "Title", :with => "Tuna Salad"
    click_on "Update Post"
    expect(page).to have_content "Post Updated!"
  end
end
