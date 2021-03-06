require 'rails_helper'

RSpec.feature "user can find the closest 10 stations" do
  scenario "when a user types in a zipcode they get stations" do
    VCR.use_cassette("stations by zip") do
      visit "/"
      fill_in :q, with: 80203
      click_button "Locate"
      expect(current_path).to eq("/search")
      #expect(current_path).to eq("/search?80203")
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Types")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
      expect(page).to have_content("ELEC")
      expect(page).to_not have_content("E85")
      expect(page).to have_selector('.station', count: 10)
    end
  end
end


#   As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
