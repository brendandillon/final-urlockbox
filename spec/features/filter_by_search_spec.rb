require 'rails_helper'

RSpec.describe "Filter links with search" do
  xit "only shows links that correspond with search", js: true do
    user = log_in_user
    FactoryGirl.create(:link, title: 'apples', user_id: user.id)
    FactoryGirl.create(:link, title: 'bananas', user_id: user.id)

    visit '/'

    expect(page).to have_content('bananas')
    fill_in 'search', with: 'ap'

    expect(page).to have_content('apples')
    expect(page).not_to have_content('bananas')
  end
end

