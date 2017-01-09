require 'rails_helper'

RSpec.describe 'can edit links' do
  xit "edits the link", js: true do
    user = log_in_user
    link = FactoryGirl.create(:link, title: 'MyLink', user_id: user.id)

    visit '/'

    click_on "Edit"
    fill_in 'link-title', with: 'Better Title'
    page.find('.edit-link').click

    expect(page).to have_content('Better Title')
    expect(page).not_to have_content('MyLink')
  end
end

