module StoreLocationService
  def self.fetch(zip)
    conn = Faraday.new(:url => 'https://api.bestbuy.com/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end


    response = conn.get "/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&pageSize=50&apiKey=#{ENV["API_KEY"]}"

    JSON.parse(response.body)["stores"]
  end
end
