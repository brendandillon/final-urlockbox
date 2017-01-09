require 'rails_helper'

RSpec.describe 'A user marks a link as unread' do
  it "changes the link to say unread", js: true do
    user = log_in_user
    link = FactoryGirl.create(:link, title: 'MyLink', user_id: user.id, read: true)

    visit '/'

    expect(page).not_to have_content('Read: false')

    click_on 'Mark as Unread'

    expect(page).to have_content('Read: false')
  end
end
