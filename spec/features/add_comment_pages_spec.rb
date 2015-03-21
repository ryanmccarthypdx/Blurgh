require 'rails_helper'

describe "the create comment process" do
  it "displays the comment form on the posts#show page" do
    Post.create(:title => "Egg Salad", :text => "chicken salad")
    visit root_path
    click_on "Egg Salad"
    expect(page).to have_content "new comment"
  end



end
