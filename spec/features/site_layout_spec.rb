require 'rails_helper'

RSpec.feature "SiteLayouts", type: :feature do
  scenario "layout links" do
    visit root_path
    expect(page).to have_link "", href: root_path, count: 2
    expect(page).to have_link "Help", href: help_path
    expect(page).to have_link "About", href: about_path
    expect(page).to have_link "Contact", href: contact_path
    # 演習
    # visit contact_path
    # expect(page).to have_title full_title("Contact") 
  end
end
