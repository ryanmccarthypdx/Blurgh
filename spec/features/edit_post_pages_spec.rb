require 'rails_helper'

describe "the edit post process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "does not display edit if created by another user" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => 9999)
    visit posts_path
    expect(page).to have_no_content "Edit"
  end

  it "brings up a prepopulated form when the edit button is clicked on the homepage" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Edit"
    expect(page).to have_content "chicken salad" && "Text"
  end
  it "makes changes when the form is submitted" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Edit"
    fill_in "Title", :with => "Tuna Salad"
    click_on "Update Post"
    expect(page).to have_content "Post Updated!"
  end
end
