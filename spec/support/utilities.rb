require 'rails_helper'

def sign_in(user)
  visit root_path
  fill_in "Name", with: user.name
  fill_in "Password", with: user.password
  click_on "Log in"
end
