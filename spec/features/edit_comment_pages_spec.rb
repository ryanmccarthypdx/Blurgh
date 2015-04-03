require 'rails_helper'

describe "the edit comment process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "does not display edit if created by another user" do
    wrong_user = FactoryGirl.create(:user, :name => "WrongUser")
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => wrong_user.id)
    comment = Comment.create(:text => "I like it too", :post_id => post.id, :user_id => wrong_user.id)
    visit post_path(post)
    expect(page).to have_no_content "Edit"
  end

  it "brings up a prepopulated form when the edit button is clicked on the comment", js: true do
    wrong_user = FactoryGirl.create(:user, :name => "WrongUser")
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => wrong_user.id)
    comment = Comment.create(:text => "I like it too", :post_id => post.id, :user_id => user.id)
    visit post_path(post)
    click_on "Edit"
    expect(page).to have_content "I like it too" && "Text"
  end

  it "brings up a prepopulated form when the edit button is clicked on the comment (HTML version)" do
    wrong_user = FactoryGirl.create(:user, :name => "WrongUser")
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => wrong_user.id)
    comment = Comment.create(:text => "I like it too", :post_id => post.id, :user_id => user.id)
    visit post_path(post)
    click_on "Edit"
    expect(page).to have_content "I like it too" && "Text"
  end
  # 
  # it "makes changes when the form is submitted" do
  #   wrong_user = FactoryGirl.create(:user, :name => "WrongUser")
  #   post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => wrong_user.id)
  #   comment = Comment.create(:text => "I like it too", :post_id => post.id, :user_id => user.id)
  #   visit post_path(post)
  #   click_on "Edit"
  #   fill_in "Text", :with => "I hate it!"
  #   click_on "Update Comment"
  #   expect(page).to have_content "Comment Updated!"
  # end
end
