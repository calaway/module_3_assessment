require 'rails_helper'

RSpec.feature "" do
  it "" do
    VCR.use_cassette("consuming_api") do
      # As a user
      # When I visit "/"
      visit "/"
      # And I fill in a search box with "80202" and click "search"
      fill_in "Search Best Buy Locations", with: "80202"
      click_on "search"
      # Then my current path should be "/search" (ignoring params)
      expect(current_path).to eq("/search")
      # And I should see stores within 25 miles of 80202
      expect(page).to have_content("stores within 25 miles of 80202")
      # And I should see a message that says "17 Total Stores"
      expect(page).to have_content("17 Total Stores")
      # And I should see exactly 15 results
# expect(page).to have_content("15 stores")
      # And I should see the long name, city, distance, phone number and store type for each of the 15 results
      expect(page).to have_content("Cherry Creek Shopping Center")
    end
  end
end
