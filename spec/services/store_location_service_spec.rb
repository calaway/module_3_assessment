require 'rails_helper'

RSpec.describe type: :model do
  it "can fetch data from the api" do
    VCR.use_cassette("consuming_api") do
      zip = 80202
      raw_stores = StoreLocationService.fetch("zip")

      expect(raw_stores.class).to eq(Array)
      expect(raw_stores.count).to eq(17)

      expect(raw_stores.first["longName"]).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(raw_stores.first["city"]).to eq("Denver")
      expect(raw_stores.first["distance"]).to eq(3.25)
      expect(raw_stores.first["phone"]).to eq("303-270-9189")
      expect(raw_stores.first["storeType"]).to eq("Mobile")
    end
  end
end
