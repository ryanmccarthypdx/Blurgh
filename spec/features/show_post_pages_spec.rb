require 'rails_helper'

describe "the show post process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "shows the text of a post when the title is clicked" do
    post = Post.create(:title => "Egg Salad", :text => "chicken salad", :user_id => user.id)
    visit posts_path
    click_on "Egg Salad"
    expect(page).to have_content "chicken salad"
  end
end
