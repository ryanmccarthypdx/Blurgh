require 'rails_helper'

describe "the destroy post process" do
  it "destroys the post" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad")
    visit root_path
    click_on "Delete"
    expect(page).to have_no_content "Egg Salad" 
  end
end
