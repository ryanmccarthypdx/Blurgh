require 'rails_helper'

describe "the create comment process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "displays the link to add a new comment on the posts#show page, but not the form" do
    Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Egg Salad"
    expect(page).to have_content "Add a new comment"
    expect(page).to have_no_content "Text"
  end

  it "shows the comment form & hides the link when the 'Add a new comment' link is clicked", js:true do
    Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Egg Salad"
    click_on "Add a new comment"
    expect(page).to have_content "Text"
    expect(page).to have_no_content "Add a new comment"
  end

  it "the HTML version will move you to the new comment page when when the 'Add a new comment' link is clicked" do
    Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Egg Salad"
    click_on "Add a new comment"
    expect(page).to have_content "Text"
    expect(page).to have_no_content "Add a new comment"
  end
  # 
  # it "successfully saves comments" do
  #   Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
  #   visit posts_path
  #   click_on "Egg Salad"
  #   fill_in "Text", :with => "I like ham salad better"
  #   click_on "Create Comment"
  #   expect(page).to have_content "Comment Saved!"
  # end
  #
  # it "displays the comment on the posts#show page after the comment is submitted" do
  #   Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
  #   visit posts_path
  #   click_on "Egg Salad"
  #   fill_in "Text", :with => "I like ham salad better"
  #   click_on "Create Comment"
  #   expect(page).to have_content "I like ham"
  # end



end
