require "rails_helper"

RSpec.describe "can create links", :js => :true do
  scenario "Create a new link" do
    log_in_user

    visit "/"
    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end
  end

  scenario "Not a valid URL", :js => :true do
    log_in_user

    visit "/"
    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "blargy blarg"
    click_on "Add Link"

    within('#links-list') do
      expect(page).not_to have_text("Turing")
      expect(page).not_to have_text("http://turing.io")
    end

    expect(page).to have_content('Url is not a valid URL')
  end

  scenario "No title", :js => :true do
    log_in_user

    visit "/"
    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do 
      expect(page).not_to have_text('http://turing.io')
    end
  end
end
