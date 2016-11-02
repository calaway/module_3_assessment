class SearchController < ApplicationController
  def index
    https://api.bestbuy.com/v1/stores(area(80202,100))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=ENV["API_KEY"]

    conn = Faraday.new(:url => 'https://api.bestbuy.com/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get "/v1/stores(area(80202,100))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV["API_KEY"]}"
response.body
ENV["API_KEY"]
  end
end