require 'rails_helper'

RSpec.describe type: :model do
  it "creates store objects from json" do
    zip = 80202
    raw_stores = [{
      "longName"=>"Best Buy Mobile - Cherry Creek Shopping Center",
      "city"=>"Denver",
      "distance"=>3.25,
      "phone"=>"303-270-9189",
      "storeType"=>"Mobile"
    },{
      "longName"=>"Best Buy - Belmar",
      "city"=>"Lakewood",
      "distance"=>5.28,
      "phone"=>"303-742-8039",
      "storeType"=>"BigBox"
    }]

    stores = Store.return_stores(raw_stores, zip)

    expect(stores.count).to eq(2)
    expect(stores.first.phone).to eq("303-270-9189")
    expect(stores.last.name).to eq("Best Buy - Belmar")
  end
end
