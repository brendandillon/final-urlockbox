require 'rails_helper'

RSpec.describe 'A user sees their links' do
  it 'shows only their links', js: true do
    user = log_in_user
    user2 = FactoryGirl.create(:user, email: 'b@gmail.com')
    FactoryGirl.create(:link, user_id: user.id, title: 'MyLink')
    FactoryGirl.create(:link, user_id: user2.id, title: 'YourLink')

    visit '/'
    expect(page).to have_content('MyLink')
    expect(page).not_to have_content('YourLink')
  end
end
