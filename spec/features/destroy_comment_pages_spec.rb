require 'rails_helper'

describe "the destroy comment process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "does not display delete if comment was created by another user" do
    wrong_user = FactoryGirl.create(:user, :name => "WrongUser")
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => wrong_user.id)
    comment = Comment.create(:text => "I like it too", :post_id => post.id, :user_id => wrong_user.id)
    visit post_path(post)
    expect(page).to have_no_content "Delete"
  end

  it "destroys the comment" do
    wrong_user = FactoryGirl.create(:user, :name => "WrongUser")
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => wrong_user.id)
    comment = Comment.create(:text => "I like it too", :post_id => post.id, :user_id => user.id)
    visit post_path(post)
    click_on "Delete"
    expect(page).to have_no_content "I like it too"
  end
end
