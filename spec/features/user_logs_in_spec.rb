require 'rails_helper'

RSpec.describe "A user logs in" do
  it "takes the user to the index page" do
    user = FactoryGirl.create(:user)

    visit '/'
    click_on 'Log In'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Submit'
    
    expect(page).to have_content('Sign Out')
  end
end
