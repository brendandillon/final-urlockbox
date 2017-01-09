require 'rails_helper'

RSpec.describe 'A user marks a link as read' do
  it "changes the link to say read", js: true do
    user = log_in_user
    link = FactoryGirl.create(:link, title: 'MyLink', user_id: user.id)

    visit '/'

    expect(page).not_to have_content('Read: true')

    click_on 'Mark as Read'

    expect(page).to have_content('Read: true')
  end
end
