require 'rails_helper'

RSpec.describe "A user logs out" do
  it 'takes them to the landing page' do
    user = FactoryGirl.create(:user)

    visit '/'
    click_on 'Log In'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Submit'

    expect(page).to have_content('Sign Out')
    expect(page).not_to have_content('Log In')

    click_on 'Sign Out'

    expect(page).not_to have_content('Sign Out')
    expect(page).to have_content('Log In')
  end
end
