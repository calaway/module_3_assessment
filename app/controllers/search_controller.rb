class SearchController < ApplicationController
  def index
    @zip = params["q"]
    conn = Faraday.new(:url => 'https://api.bestbuy.com/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get "/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&pageSize=50&apiKey=#{ENV["API_KEY"]}"

    raw_stores = JSON.parse(response.body)["stores"]

    @stores = Store.return_stores(raw_stores)
  end
end
