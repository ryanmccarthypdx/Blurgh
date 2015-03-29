require 'rails_helper'

describe "the show post process" do
  it "shows the text of a post when the title is clicked" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad")
    visit posts_path
    click_on "Egg Salad"
    expect(page).to have_content "chicken salad"
  end
end
