require 'rails_helper'

RSpec.describe 'can edit links' do
  scenario "Edit a link" do
    user = log_in_user
    FactoryGirl.create(:link, user: user)
  end
end

