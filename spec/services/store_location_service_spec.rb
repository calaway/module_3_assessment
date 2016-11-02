require 'rails_helper'

RSpec.describe type: :model do
  it "can fetch data from the api" do
    VCR.use_cassette("consuming_api") do
      zip = 80202
      raw_stores = StoreLocationService.fetch("zip")

      expect(raw_stores.class).to eq(Array)
      expect(raw_stores.count).to eq(17)
      expect(page).to have_content("Cherry Creek Shopping Center")
      expect(page).to have_content("Denver")
      expect(page).to have_content("3.25")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Mobile")
    end
  end
end
