require 'rails_helper'

RSpec.describe "A user creates an account" do
  context "valid information" do
    it "takes them to the index of links" do
      visit '/'
      click_on 'Sign Up'

      fill_in 'user_email', with: 'a@gmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password_confirmation'

      click_on 'Submit'

      expect(page).to have_content('Sign Out')
    end
  end

  context "email already used" do
    it "shows an error message" do
      FactoryGirl.create(:user, email: 'a@gmail.com') 

      visit '/'
      click_on 'Sign Up'

      fill_in 'user_email', with: 'a@gmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password_confirmation'

      click_on 'Submit'

      expect(page).to have_content('Email has already been taken')
    end
  end
end
