# When I visit "/"
# And I fill in the search form with 80203
# And I enter "5" into an optional "Distance" field
# And I click "Locate"
# Then I should see a list of the 10 closest stations of any type within 5 miles sorted by distance
# And the results should share the same format as above
# And I should see about 6 pagination links at the bottom of the results (As of the writing of this story there are 63 results. Number of links should be RESULTS divided by 10)

require 'rails_helper'

RSpec.feature "user can filter results by distance" do
  visit "/"
  fill_in :q, with: "80203"
  fill_in :distance, with: "5"
  click_button "Locate"

  expect(page).to have_selector('.station', count: 10)
  #has any fuel type
  expect(page).to have_content("Name")
  expect(page).to have_content("Address")
  expect(page).to have_content("Fuel Types")
  expect(page).to have_content("Distance")
  expect(page).to have_content("Access Times")
end
