require 'rails_helper'

describe "the destroy post process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "does not display delete if created by another user" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => 9999)
    visit posts_path
    expect(page).to have_no_content "Delete"
  end

  it "destroys the post" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Delete"
    expect(page).to have_no_content "Egg Salad"
  end
end
