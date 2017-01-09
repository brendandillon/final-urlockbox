require 'rails_helper'

RSpec.describe "Filter links by read" do
  it "only shows read links", js: true do
    user = log_in_user
    FactoryGirl.create(:link, title: 'ReadLink', user_id: user.id, read: true)
    FactoryGirl.create(:link, title: 'UnreadLink', user_id: user.id)

    visit '/'

    expect(page).to have_content('UnreadLink')
    click_on "Only Read Links"

    expect(page).not_to have_content('UnreadLink')
    expect(page).to have_content('ReadLink')
  end

  it "only shows unread links", js: true do
    user = log_in_user
    FactoryGirl.create(:link, title: 'ReadLink', user_id: user.id, read: true)
    FactoryGirl.create(:link, title: 'UnreadLink', user_id: user.id)

    visit '/'

    expect(page).to have_content('ReadLink')
    click_on "Only Unread Links"

    expect(page).not_to have_content('ReadLink')
    expect(page).to have_content('UnreadLink')
  end
end

