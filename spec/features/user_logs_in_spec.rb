require 'rails_helper'

RSpec.describe "A user logs in" do
  context 'valid credentials' do
    it "takes the user to the index page" do
      user = FactoryGirl.create(:user)

      visit '/'
      click_on 'Log In'
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on 'Submit'
      
      expect(page).to have_content('Sign Out')
      expect(page).to have_content('Log in successful')
    end
  end

  context 'invalid credentials' do
    it 'does not log in' do
      visit '/'
      click_on 'Log In'
      fill_in 'email', with: 'bleep bloop'
      fill_in 'password', with: 'blardy blar'
      click_on 'Submit'
      
      expect(page).not_to have_content('Sign Out')
      expect(page).to have_content('Log in failed')
    end
  end
end
