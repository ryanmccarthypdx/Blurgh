require 'rails_helper'

describe "the edit post process" do
  it "brings up a prepopulated form when the edit button is clicked on the homepage" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad")
    visit root_path
    click_on "Edit"
    expect(page).to have_content "chicken salad" && "Text"
  end
end
