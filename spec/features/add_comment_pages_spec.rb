require 'rails_helper'

describe "the create comment process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "displays the comment form on the posts#show page" do
    Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Egg Salad"
    expect(page).to have_content "new comment"
  end

  it "successfully saves comments" do
    Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Egg Salad"
    fill_in "Text", :with => "I like ham salad better"
    click_on "Create Comment"
    expect(page).to have_content "Comment Saved!"
  end

  it "displays the comment on the posts#show page after the comment is submitted" do
    Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Egg Salad"
    fill_in "Text", :with => "I like ham salad better"
    click_on "Create Comment"
    expect(page).to have_content "I like ham"
  end



end
